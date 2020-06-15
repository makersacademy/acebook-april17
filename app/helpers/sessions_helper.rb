# frozen_string_literal: true

# Sessions helper
module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def prevent_view
    flash[:error] = 'You must be logged in to access this section'
    redirect_to root_path
  end

  def authenticated(user)
    user&.authenticate(params[:session][:password])
  end

  def login_and_redirect(user)
    log_in user
    redirect_to "/#{user.id}"
  end

  def invalid_login
    flash.now[:danger] = 'Invalid login'
    render 'new'
  end
end
