class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery as: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def signup
  end

  def homepage
  end


  def after_sign_in_path_for(resource)
    if current_user.meta_type = "Investor"
      investors_path(current_user)
    else
      individuals_path(current_user)
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
  end
end
