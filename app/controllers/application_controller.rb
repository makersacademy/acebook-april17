# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login, :authenticated_user
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  private

  def require_login
    redirect_to home_path unless session[:user_id]
  end

  def authenticated_user
    redirect_to posts_path if session[:user_id]
  end
end
