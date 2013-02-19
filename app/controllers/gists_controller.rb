class GistsController < ApplicationController
  include GistsHelper
  def index
    unless session[:session_token].nil?
      @user = User.find_by_session_token(session[:session_token])
    end

    if @user
      @gists = @user.gists
    else
      flash[:notice] = "Must login to access this page!"
      redirect_to new_sessions_path
    end
  end

  def new
    @gist = Gist.new
    3.times { @gist.files.build }
    @user = User.find_by_session_token(session[:session_token])
  end

  def create
    gist = Gist.new(params[:gist])

    if gist.save
      redirect_to gist_path(gist)
    else
      flash[:error] = "Unable to create the gist"
      redirect_to 'new'
    end
  end

  def show
    @user = User.find_by_session_token(session[:session_token])
    @gist = Gist.find(params[:id])
    @gist_files = @gist.files
    @favorited = favorited?(@user.id, @gist.id)
    @tagging = Tagging.new
  end

  def update
    @gist = Gist.find(params[:id])
    @gist.update_attributes!(params[:gist])
    redirect_to gist_path(@gist)
  end
end
