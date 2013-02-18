class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_user_name(params[:user_name])

    if @user
      session_token = SecureRandom.base64
      @user.session_token = session_token
      @user.save!
      session[:session_token] = session_token
      redirect_to user_path(@user)
    else
      flash[:error] = "Username not found"
      render "new"
    end
  end

  def destroy
    @user = User.find_by_session_token(session[:session_token])
    @user.session_token = nil
    @user.save!

    session[:session_token] = nil

    redirect_to root_path
  end
end
