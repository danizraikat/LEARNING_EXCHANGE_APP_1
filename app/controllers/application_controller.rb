class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters , if: :devise_controller?
  
  def configure_permitted_parameters 
    devise_parameter_sanitizer.for(:sign_up) do |u|   
      u.permit(:email, :password, :passwword_confirmation, :profile_image, :first_name, :last_name, :username, :bio, :location, :website_1, :website_2, :website_3, :ga_course)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|   
      u.permit(:email, :password, :passwword_confirmation, :profile_image, :first_name, :last_name, :username, :bio, :location, :website_1, :website_2, :website_3, :ga_course, :current_password)        
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to root_url
  end  

end
