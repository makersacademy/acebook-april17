class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def update
    current_user.avatar = params[:user][:avatar]
    current_user.save!
    redirect_to user_path
  end

  private

  def user_params
    params.require(:user).permit(:avatar)
  end
end
