class SigninController < ApplicationController
  def index
    # @user = Signup.find_by(username: params[:username])
end

  def new
  end

  def create
    @user = Signup.find_by(username: params[:signin][:username])
    if @user && @user.password == params[:signin][:password]
      redirect_to posts_url
    else
      render 'new'
    end

  end

  def destroy
  end

end
