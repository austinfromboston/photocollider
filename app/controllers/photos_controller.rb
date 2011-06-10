class PhotosController < ApplicationController
  before_filter :set_contest, :except => [:edit, :update]
  before_filter :authenticate_user!
  # GET /photos
  # GET /photos.xml
  def index
    @photos = @contest.photos.for_user(current_user)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @photos }
    end
  end

  # GET /photos/1
  # GET /photos/1.xml
  def show
    @photo = @contest.photos.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @photo }
    end
  end

  # GET /photos/new
  # GET /photos/new.xml
  def new
    @photo = Photo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = current_user.photos.find(params[:id])
  end

  # POST /photos
  # POST /photos.xml
  def create
    @photo = current_user.photos.new(params[:photo])
    @photo.contest = @contest

    if @photo.save
      redirect_to(contest_photos_path(@contest), :notice => 'Photo was successfully created.')
    else
      render :action => "new"
    end
  end

  # PUT /photos/1
  # PUT /photos/1.xml
  def update
    @photo = current_user.photos.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to(contest_photos_path(@photo.contest), :notice => 'Photo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  private

  def set_contest
    @contest = Contest.find params[:contest_id]
  end

end
