class UsersController < Clearance::BaseController
  before_action :redirect_signed_in_users, only: [:create, :new]
  skip_before_action :require_login, only: [:create, :new], raise: false

  def index
    @users = User.all
  end

  def new
    @user = User.new
    render template: "users/new"
  end

  def create
    @user = user_from_params

    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end

  private

  def redirect_signed_in_users
    return unless signed_in?
    
    redirect_to url_after_create
  end

  def url_after_create
    wall_url(params[:id] = current_user.id)
  end

  def user_from_params
    email = user_params.delete(:email)
    password = user_params.delete(:password)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
