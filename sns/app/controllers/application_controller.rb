class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :current_user?
  private
  def user_logged_in!
  	flash[:alert] = 'このページを表示するためには、ログインしてください！'
	redirect_to login_url
  end
  def sign_in(user)
  	session[:user_id] = user.id if user.present?
  end
  def sign_out
  	session[:user_id] = nil
  end
  def current_user
  	@current_user ||= User.find_by id: session[:user_id] if session[:user_id]

  end
  def current_user?
  	current_user.present?
  end
end
