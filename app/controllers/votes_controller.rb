class VotesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :verify_juror, :only => :create

  def create
    if current_user.votes.create params[:vote].merge(:round_id => params[:round_id])
      render :text => 'Voted'
    else
      render :text => 'Problem voting, please try again'
    end
  end

  def verify_juror
    raise "Only jurors can vote" unless current_user.juror?
  end


end
