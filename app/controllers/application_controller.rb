# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[name username email password avatar avatar_cache])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[name username email password current_password avatar])
  end
end
