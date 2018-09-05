# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if
    session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end

  private

  def authenticate_user!
    if current_user

    elsif request.original_fullpath != root_path
      redirect_to root_path, notice: 'Please Login to view that page!'
    end
  end
end
