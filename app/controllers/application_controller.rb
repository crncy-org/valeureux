class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Zelf toegevoegd
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :first_name, :last_name, :salutation, :phone_number, :user_type, :vat_number) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :current_password, :first_name, :last_name, :salutation, :phone_number, :user_type, :vat_number) }
    end
  end

