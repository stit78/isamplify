class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :test]

  def home
    @samples = Sample.all
    @pending_sample_count = Sample.where(status: "pending").count
    @received_sample_count = Sample.where(status: "received").count
    @tested_sample_count = Sample.where(status: "tested").count
    @labelled_sample_count = Sample.where(status: "labelled").count

  end

  def test
  end
end
