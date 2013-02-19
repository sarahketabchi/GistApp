class FavoritesController < ApplicationController
  def create
    @user = User.find_by_session_token(session[:session_token])
    @gist = Gist.find(params[:gist_id])

    @favorite = Favorite.create!(:user_id => @user.id, :gist_id => @gist.id)
    render :nothing => true
  end

  def destroy
    @user = User.find_by_session_token(session[:session_token])
    @gist = Gist.find(params[:gist_id])

    Favorite.where(:user_id => @user.id, :gist_id => @gist.id).first.destroy

    render :nothing => true
  end
end
