module ApplicationHelper
  def logged_in?
    if session[:session_token].nil?
      return false
    else
      return true
    end
  end
end
