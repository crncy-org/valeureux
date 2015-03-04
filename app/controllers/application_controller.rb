class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Zelf toegevoegd
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!


  # added om devise te gebruiken op landingpage

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  helper_method :resource, :resource_name, :devise_mapping

  # ----------

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :first_name, :last_name, :salutation, :phone_number, :user_type, :vat_number) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :current_password, :first_name, :last_name, :salutation, :phone_number, :user_type, :vat_number) }
  end

   def after_sign_in_path_for(user)
    home_index_path
  end
end

