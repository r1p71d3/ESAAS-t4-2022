class ApplicationController < ActionController::Base

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def has_auth
    unless is_admin_or_current_breeder
      flash.keep[:warning] = "Not authorized"
      redirect_to login_url
    end
  end

  def is_admin
    !current_user.nil? && current_user[:user_type].to_s == "admin"
  end

  def is_admin_or_current_breeder
    !current_user.nil? && (current_user[:user_type].to_s == "admin" || UserToBreeder.get_user_id(@breeder.id.to_s).to_s == current_user.id.to_s)
  end

  def not_this_user
    current_user.nil? or current_user.id.to_s != UserToBreeder.get_user_id(@breeder[:id]).to_s
  end
end
