class VotesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :verify_juror, :only => :create

  def create
    if current_user.votes.create params[:vote]
      flash[:notice] = "Your vote has been recorded"
      redirect_to :back
    else
      flash[:error] = "Sorry, had a problem recording that vote"
    end
  end

  def verify_juror
    raise "Only jurors can vote" unless current_user.juror?
  end


end
