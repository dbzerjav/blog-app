class User::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters
  
  private
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:email, :username, :password, :password_confirmation)
    devise_parameter_sanitizer.for(:sign_in).push(:email, :username, :confirmation_token)
    devise_parameter_sanitizer.for(:account_update).push(:email, :username, :confirmation_token)
  end
end