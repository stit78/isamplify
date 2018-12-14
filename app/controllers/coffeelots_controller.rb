class CoffeelotsController < ApplicationController
  def show
    @coffee_lot = CoffeeLot.find(params[:id])
    @acidity = ""
    @clean = ""
    @sweetness = ""
    @labels = ""
    @exporter = ""

    @coffee_lot.samples.each do |sample|
      if @exporter == ""
        @exporter = sample.exporter
      end
    end

    if @coffee_lot.samples.count > 1
      @coffee_lot.samples.order(created_at: :desc).each do |sample|
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

  def update
    @coffee_lot = CoffeeLot.find(params[:id])
    if @coffee_lot.update(coffee_lot_params)
      redirect_to coffeelot_path(@coffee_lot)
    else
      flash[:alert] = "Sorry, something went wrong"
      redirect_to coffee_lot_path(@coffee_lot)
    end
  end

  private

  def coffee_lot_params
    params.require(:coffee_lot).permit(:provenance,
                                       :region,
                                       :quantity,
                                       :tree,
                                       :screen_size,
                                       :cup_profile,
                                       :quality_description)
  end
end
