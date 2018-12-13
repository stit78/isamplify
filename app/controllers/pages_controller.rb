class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :set_samples_count, only: [:home]

  def home
    @samples = Sample.all.order(stage: :desc)
    @coffee_lot = CoffeeLot.all
    @quantity = @coffee_lot.map { |lot| lot.quantity }
    @scrapper_results = Scrapper.new.call
  end

  def set_samples_count
    @samples_count = []
    @samples_count << Sample.count_with_status("pending")
    @samples_count << Sample.count_with_status("received")
    @samples_count << Sample.count_with_status("tested")
    @samples_count << Sample.count_with_status("labelled")
    @samples_count << Sample.count_with_status("sent")
  end
end

