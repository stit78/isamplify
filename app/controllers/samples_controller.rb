class SamplesController < ApplicationController
  def pending_index
    @samples = Sample.pending
  end

  def received_index
    @samples = Sample.received
  end

  def tested_index
    @samples = Sample.tested
    respond_to do |format|
      format.html
      format.pdf do
        pdf = Prawn::Document.new
        pdf.text "Hello"
        send_data pdf.render, filename: 'samples.pdf', type: 'application/pdf', disposition: "inline"
      end
    end
  end

  def labelled_index
    @samples = Sample.labelled
  end

  def sent_index
    @samples = Sample.sent
  end

  def show
    @sample = Sample.find(params[:id])
  end

  def new
    @sample = Sample.new
    # authorize @coffeelot
    # authorize @sample
  end

  def edit
    @sample = Sample.find(params[:id])
  end

  def update_after_reception
    @sample = Sample.find(params[:id])
    if @sample.received!
      flash[:notice] = "The sample #{@sample.id} has been received"
      redirect_to pending_index_samples_path
    else
      flash[:alert] = "Sorry, something went wrong"
      redirect_to pending_index_samples_path
    end
  end

  def update_after_test
    @sample = Sample.find(params[:id])
    @sample.status = "tested"
    if @sample.update(review_params)
      flash[:notice] = "The sample #{@sample.id} has been tested"
      redirect_to received_index_samples_path
    else
      flash[:alert] = "Sorry, something went wrong"
      redirect_to received_index_samples_path
    end
  end

  def update_after_labelling
    @sample = Sample.find(params[:id])
    @sample.status = "received"
    @sample.save
    flash[:notice] = "The sample #{@sample.id} has been labelled"
    redirect_to tested_index_samples_path

    # else
    #   flash[:alert] = "Sorry, something went wrong"
    #   redirect_to tested_index_samples_path
    # end
  end

  def update_after_emailing
    @sample = Sample.find(params[:id])
    @sample.status = "labelled"
    @sample.save
    flash[:notice] = "The sample #{@sample.id} has been sent"
    redirect_to sent_index_samples_path
  end

  def create
    @exporter = User.find_by(role: "Exporter")
    @sample = Sample.new(review_params)
    @sample.trader = current_user
    @sample.exporter_id = @exporter.id
    @sample.status = "received"
    @sample.coffee_lot = CoffeeLot.last
    @sample.save
    # redirect_to sample_path(@sample)
  end

  def email
    @sample = current_user.sample.build(re_params)

    if @restaurant.save
      RestaurantMailer.creation_confirmation(@restaurant).deliver_now
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:sample).permit(:stage, :coffee_lot, :sweetness, :acidity, :clean, :status, :trader)
  end
end
