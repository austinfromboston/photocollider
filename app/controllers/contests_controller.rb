class ContestsController < ApplicationController
  # GET /contests
  # GET /contests.xml
  def index
    @contests = Contest.all
  end

  def show
    @contest = Contest.find params[:id]
  end
end
