class SamplesController < ApplicationController
  def index
    @samples = Sample.all
  end

  def show
    @sample = Sample.find(params[:id])
  end

  def new
    @coffeelot = CoffeeLot.find(params[:id])
    @sample = Sample.new
    # authorize @coffeelot
    # authorize @sample
  end

  def create
    @sample = Sample.find(params[:id])
    @sample.coffee_lot = coffeelot
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
