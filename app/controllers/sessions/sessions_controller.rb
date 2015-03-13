class Sessions::SessionsController < Devise::SessionsController
  before_filter :configure_sign_in_params, only: [:create]

  layout "landing"

  protected

  # You can put the params you want to permit in the empty array.
  def configure_sign_in_params
    devise_parameter_sanitizer.for(:sign_in) << :attribute
  end
end
