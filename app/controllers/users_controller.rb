# frozen_string_literal: true

# user controller
class UsersController < ApplicationController
  before_action :require_login, except: %i[new create]

  def show
    @user = User.find(params[:id])
    @posts = Post.where(wall_id: @user.id).order(updated_at: :desc)
  end

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    check_login_success(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  def require_login
    prevent_view unless logged_in?
  end
end
