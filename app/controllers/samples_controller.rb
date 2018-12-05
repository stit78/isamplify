class SamplesController < ApplicationController
  def pending_index
    @samples = Sample.pending
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

  def update_after_test
    @sample = Sample.find(params[:id])
    @sample.status = "tested"
    if @sample.update(review_params)
      flash[:notice]= "the test has been registered"
      redirect_to received_index_samples_path
    else
      flash[:alert]= "sorry, something went wrong"
      redirect_to received_index_samples_path
    end
  end

  def create
    @sample = Sample.find(params[:id])
    @sample.trader = current_user.role
    @sample.status = "Received"
    @sample.stage = "Offer Sample"

    if @sample.save
      redirect_to sample_path(@sample)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:sample).permit(:stage, :sweetness, :acidity, :clean, :status)
  end
end
