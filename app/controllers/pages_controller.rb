class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :test]

  def home
    @samples = Sample.all.order(stage: :desc)
    @coffee_lot = CoffeeLot.all
    @quantity = 0
    @quantity = @coffee_lot.map { |lot| lot.quantity }

    @pending_sample_count = Sample.where(status: "pending").count
    @received_sample_count = Sample.where(status: "received").count
    @tested_sample_count = Sample.where(status: "tested").count
    @labelled_sample_count = Sample.where(status: "labelled").count

  end

  def test
  end
end
