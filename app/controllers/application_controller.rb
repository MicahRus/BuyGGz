class ApplicationController < ActionController::Base
  # This ensures that the user is logged in. 
  before_action :authenticate_user!
  # This is unused, but if I didn't have the above line of code it would run the flash message below if trying to access a page while not logging in.
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from CanCan::AccessDenied do |exception|
    flash[:authorization_error] = "Not authorized to perform that action ❌"
    redirect_to root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
