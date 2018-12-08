class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :test]

  def home
    @samples = Sample.all.order(stage: :desc)
    @coffee_lot = CoffeeLot.all
    @quantity = @coffee_lot.map { |lot| lot.quantity }
  end
end
