class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      session_token = SecureRandom.base64
      @user.session_token = session_token
      @user.save!
      session[:session_token] = session_token
      redirect_to root_path
    else
      flash[:error] = "Invalid username"
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
