class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, unless: :devise_controller?

  after_filter :store_location


  # added to use devise on landing page
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

  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    return unless request.get?
    if (request.path != "/users/sign_in" &&
        request.path != "/users/sign_up" &&
        request.path != "/users/password/new" &&
        request.path != "/users/password/edit" &&
        request.path != "/users/confirmation" &&
        request.path != "/users/sign_out" &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath
    end
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

  # ----------

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :first_name, :last_name, :salutation, :phone_number, :user_type, :vat_number, :picture, :address) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :current_password, :first_name, :last_name, :salutation, :phone_number, :user_type, :vat_number, :picture, :address) }
  end

  def after_sign_in_path_for(user)
    home_index_path
  end

  # def authenticate_user!
  #   redirect_to root_path, notice: "You must login" unless user_signed_in?
  # end


  #werkt niet... Wat je wilt is dat je na editen gewoon in activiteit komt en niet op sign-up page.

  # def after_update_path_for(user)
  #   home_index_path
  # end
end

