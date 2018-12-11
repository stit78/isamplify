class ApprovedSamplesController < ApplicationController

  def index
    @samples = Sample.approved
  end

end
