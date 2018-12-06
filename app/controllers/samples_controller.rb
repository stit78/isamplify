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
    @acidity = ""
    @clean = ""
    @sweetness = ""
    @labels = ""

    @sample.coffee_lot.samples.order(created_at: :desc).each do |sample|
      if sample.id != @sample.id
        if @acidity == "" && @clean == "" && @sweetness == ""
          @acidity = sample.acidity.to_s
          @clean = sample.clean.to_s
          @sweetness = sample.sweetness.to_s
          @labels = sample.stage.to_s
        else
          @acidity.insert(-1, ",#{sample.acidity.to_s}")
          @clean.insert(-1, ",#{sample.clean.to_s}")
          @sweetness.insert(-1, ",#{sample.sweetness.to_s}")
          @labels.insert(-1, ",#{sample.stage.to_s}")
        end
      end
    end
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
      flash[:notice] = "The sample #{@sample_id} has been received"
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
    @sample.status = "labelled"
    @sample.save
    flash[:notice] = "The sample #{@sample.id} has been labelled"
    redirect_to tested_index_samples_path

    # else
    #   flash[:alert] = "Sorry, something went wrong"
    #   redirect_to tested_index_samples_path
    # end
  end

  def create
    @sample = Sample.new
    @sample.trader = current_user
    @sample.status = "received"
    @sample.stage = "Offer Sample"

    @sample.save
    # redirect_to sample_path(@sample)
  end


  private

  def review_params
    params.require(:sample).permit(:stage, :sweetness, :acidity, :clean, :status)
  end
end
