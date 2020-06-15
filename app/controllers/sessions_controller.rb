# frozen_string_literal: true

# Sessions controller
class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    authenticated(user) ? login_and_redirect(user) : invalid_login
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
