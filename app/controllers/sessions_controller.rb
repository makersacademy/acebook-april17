class SessionsController < ApplicationController

  protect_from_forgery

  def new
    if logged_in?
      flash[:login_already] = ['you are already logged in']
      redirect_to posts_path
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to posts_path
    else
      flash[:login_errors] = ['Invalid email/password combination']
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
