class SessionsController < ApplicationController
  # skip_before_action :login_required, :only => [:new, :create]

  def new
    @user = User.new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to posts_url, :notice => "Welcome back, #{user.email}"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_url
  end

  private

  def login(user)
    session[:user_id] = nil
  end

end
