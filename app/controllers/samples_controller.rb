class SamplesController < ApplicationController
  before_action :set_samples_count, only: [:pending_index, :received_index, :tested_index, :labelled_index, :sent_index]
  before_action :set_find_sample, only: [:update_after_reception, :update_after_test, :update_after_labelling, :update_after_emailing, :update]

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

  def approved_index
    @samples = Sample.approved
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "contract",
               # orientation: 'Landscape',
               layout: 'pdf',
               template: "samples/approved_index.pdf.erb",
               locals: { :samples => @samples }
      end
    end
  end

  def new
    @sample = Sample.new
    # authorize @coffeelot
    # authorize @sample
  end

  # def edit
  #   @sample = Sample.find(params[:id])
  # end

  def create
    exporter = User.find_by(role: "Exporter")
    @sample = Sample.new(review_params)
    @sample.trader = current_user
    @sample.exporter = exporter
    @sample.status = "pending"
    if @sample.save
      flash[:notice] = "The sample #{@sample.id} from coffee lot #{@sample.coffee_lot.iconumber} has been created"
      redirect_to pending_index_samples_path
    else
      flash[:alert] = "Sorry, something went wrong"
      redirect_to pending_index_samples_path
    end
  end

  def update_after_reception
    if @sample.received!
      respond_to do |format|
        format.html do
          flash[:notice] = "The sample #{@sample.id} has been received"
        end

        format.js do
          set_samples_count
          render :update_navbar
        end
      end
    else
      respond_to do |format|
        format.html do
          flash[:alert] = "Sorry, something went wrong."
        end

        format.js do
          set_samples_count
          render :update_navbar
        end
      end
    end
  end

  def update_after_test
    @sample.status = "tested"

    if @sample.update(review_params)
      respond_to do |format|
        format.html do
          flash[:notice] = "The sample #{@sample.id} has been tested"
          redirect_to received_index_samples_path
        end

        format.js do
          set_samples_count
          render :update_navbar
        end
      end
    else
      respond_to do |format|
        format.html do
          flash[:alert] = "Sorry, something went wrong. Please ensure numbers are between 1 and 10."
          redirect_to received_index_samples_path
        end

        format.js do
          set_samples_count
          render :update_navbar
        end
      end
    end
  end

  def update_after_labelling
    @sample.status = "labelled"
    @sample.save
    @etiquette = Etiquette.new
    @etiquette.sample = @sample
    @etiquette.save

    respond_to do |format|
      format.html do
        flash[:notice] = "The sample #{@sample.id} has been labelled"
        redirect_to tested_index_samples_path
      end

      format.js do
        set_samples_count
        render :update_navbar
      end
    end

    # else
    #   flash[:alert] = "Sorry, something went wrong"
    #   redirect_to tested_index_samples_path
    # end
  end

  def update_after_emailing
    ExporterMailer.reception_confirmation(@sample).deliver_now
    @sample.status = "sent"
    @sample.save

    respond_to do |format|
      format.html do
      flash[:notice] = "The sample #{@sample.id} has been sent"
      redirect_to labelled_index_samples_path
    end
      format.js do
        set_samples_count
        render :update_navbar
      end
    end
  end

  def update_after_sent
    @sample.status = "approved"
    @sample.save

    respond_to do |format|
      format.html do
        flash[:notice] = "The sample #{@sample.id} has been approved"
        redirect_to sent_index_samples_path
      end

      format.js do
        set_samples_count
        render :update_navbar
      end
    end
  end

  def update
    if @sample.update(review_params)
      flash[:notice] = "The sample #{@sample.id} has been tested"
      redirect_to sent_index_samples_path
    else
      flash[:alert] = "Sorry, something went wrong."
      redirect_to sent_index_samples_path
    end
  end

  def email
    @sample = Sample.find(params[:id])
    ExporterMailer.reception_confirmation(@sample).deliver_now
    redirect_to labelled_index_samples_path
    @sample.status = "sent"
    @sample.save
    flash[:notice] = "The sample #{@sample.id} has been sent"
  end

  def search_samples
    @samples = Sample.search_sample(params[:search])
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
    @samples_count << Sample.count_with_status("sent")
  end

  def set_find_sample
    @sample = Sample.find(params[:id])
  end
end
