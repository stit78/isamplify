class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :test]

  def home
    @samples = Sample.all
  end

  def test
  end
end
