class RoundsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :verify_juror, :only => :show
  before_filter :verify_superuser, :only => [:new, :create]

  def show
    @round = Round.find params[:id]
    @photos = @round.photos
  end

  def new
    @contest = Contest.find params[:contest_id]
    @round = @contest.rounds.build
    @eligible_photos = @contest.photos.group('photos.id').includes(:votes).order("count(votes.id) desc") 
    @eligible_photos.each { |photo| @round.round_participations.build :photo_id => photo.id }
  end

  def create
    @round = Round.new(params[:round])
    if @round.save
      flash[:notice] = "New round made with #{@round.photos.count} photos"
      redirect_to root_path
    else
      flash[:error] = "problem creating this round"
      @contest = @round.contest
      render :new
    end
  end
end
