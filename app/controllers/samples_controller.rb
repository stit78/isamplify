class SamplesController < ApplicationController
  before_action :set_samples_count, only: [:pending_index, :received_index, :tested_index, :labelled_index, :sent_index]

  def pending_index
    @samples = Sample.pending
    @coffee_lots = CoffeeLot.all
    @new_sample = Sample.new
    @new_coffee_lot = CoffeeLot.new
  end

  def received_index
    @samples = Sample.received
  end

  def tested_index
    @samples = Sample.tested
  end

  def labelled_index
    @samples = Sample.labelled
  end

  def sent_index
    @samples = Sample.sent
  end

  def new
    @sample = Sample.new
    # authorize @coffeelot
    # authorize @sample
  end

  def edit
    @sample = Sample.find(params[:id])
  end

  def create
    exporter = User.find_by(role: "Exporter")
    @sample = Sample.new(review_params)
    @sample.trader = current_user
    @sample.exporter = exporter
    @sample.status = "pending"
    if @sample.save
      flash[:notice] = "The sample #{@sample.id} from coffee lot ##{@sample.coffee_lot.iconumber} has been created"
      redirect_to pending_index_samples_path
    else
      flash[:alert] = "Sorry, something went wrong"
      redirect_to pending_index_samples_path
    end
  end

  def update_after_reception
    @sample = Sample.find(params[:id])
    if @sample.received!
      flash[:notice] = "The sample #{@sample.id} has been received"
    else
      flash[:alert] = "Sorry, something went wrong"
    end
  end

  def update_after_test
    @sample = Sample.find(params[:id])
    @sample.status = "tested"
    if @sample.update(review_params)
      flash[:notice] = "The sample #{@sample.id} has been tested"
      redirect_to received_index_samples_path
    else
      flash[:alert] = "Sorry, something went wrong. Please ensure numbers are between 1 and 10."
      redirect_to received_index_samples_path
    end
  end

  def update_after_labelling
    @sample = Sample.find(params[:id])
    @sample.status = "labelled"
    @sample.save
    @etiquette = Etiquette.new
    @etiquette.sample = @sample
    @etiquette.save
    flash[:notice] = "The sample #{@sample.id} has been labelled"
    redirect_to tested_index_samples_path

    # else
    #   flash[:alert] = "Sorry, something went wrong"
    #   redirect_to tested_index_samples_path
    # end
  end

  def update_after_emailing
    @sample = Sample.find(params[:id])
    ExporterMailer.reception_confirmation(@sample).deliver_now
    @sample.status = "sent"
    @sample.save
    flash[:notice] = "The sample #{@sample.id} has been sent"
    redirect_to labelled_index_samples_path
  end

  def email
    @sample = Sample.find(params[:id])
    ExporterMailer.reception_confirmation(@sample).deliver_now
    redirect_to labelled_index_samples_path
    @sample.status = "sent"
    @sample.save
    flash[:notice] = "The sample #{@sample.id} has been sent"
  end

  private

  def review_params
    params.require(:sample).permit(:stage, :coffee_lot_id, :sweetness, :acidity, :clean, :status, :trader)
  end

  def set_samples_count
    @samples_count = []
    @samples_count << Sample.count_with_status("pending")
    @samples_count << Sample.count_with_status("received")
    @samples_count << Sample.count_with_status("tested")
    @samples_count << Sample.count_with_status("labelled")
  end
end
