class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :set_last_request_at 
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])

   devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
  def set_last_request_at 
    current_user.update_attribute(:last_request_at, Time.now) if user_signed_in? 
  end 
end
