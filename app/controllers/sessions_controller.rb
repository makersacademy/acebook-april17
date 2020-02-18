class SessionsController < ApplicationController
  before_action :authenticate_user, only: %i[home profile setting]
  before_action :save_login_state, only: %i[login login_attempt]

  def login
    # Login Form
  end

  def login_attempt
    user = User.find_by(email: params[:sessions][:email])
    if user&.authenticate(params[:sessions][:password])
      flash[:notice] = "Welcome back, you are logged in as #{user.email}"
      session[:user_id] = user.id
      redirect_to('/posts/index')
    else
      flash[:notice] = 'Invalid Username or Password'
      flash[:color] = 'invalid'
      render 'login'
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = 'Successfully logged out'
    redirect_to action: 'login'
  end
end
