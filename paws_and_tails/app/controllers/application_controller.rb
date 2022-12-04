class ApplicationController < ActionController::Base

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    if current_user.nil?
      flash.keep[:warning] = "Not authorized"
      redirect_to login_url
    end
  end

  def is_admin
    current_user[:user_type].to_s == "admin"
  end

  def is_current_user(given_id)
    current_user[:id].to_i == given_id.to_i
  end
end
