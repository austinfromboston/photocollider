class RoundsController < ApplicationController
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
    if @round = Round.create(params[:round])
      flash[:notice] = "New round made with #{@round.photos.count} photos"
      redirect_to root_path
    else
      flash[:error] = "problem creating this round"
      render :new
    end
  end
end
