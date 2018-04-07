class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :correct_user?

  def authentication_required
    if !logged_in?
      redirect_to root_path, flash: {notice: "You need to be logged in to do that!"}
    end
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

end
