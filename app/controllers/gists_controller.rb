class GistsController < ApplicationController
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
  end

  def create
  end

  def show
    @gist = Gist.find(params[:id])
  end
end
