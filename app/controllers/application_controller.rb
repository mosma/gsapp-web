class ApplicationController < ActionController::Base
  include GarageHelper
  include ProductHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :update_sanitized_params, if: :devise_controller?

  def update_sanitized_params
    puts "hahahahahahahaha"
    devise_parameter_sanitizer.for(:sign_up) do
      |u| u.permit(:garage, {garage_attributes: [:name]}, :email, :password, 
        :password_confirmation)
    end
  end
  # Redirects user after sign_in
  def after_sign_in_path_for(resource)
    case resource
      when User then my_garage_path
      when Admin then admin_dashboard_path
    end
  end
end
