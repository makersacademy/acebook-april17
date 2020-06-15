class AvatarsController < ApplicationController
  before_action :set_avatar, only: [:show, :edit, :update, :destroy]

  def index
    @avatars = Avatar.all
  end

  def show
  end

  def new
    @avatar = Avatar.new
  end

  def edit
  end


  def create
    @avatar = Avatar.new(avatar_params)
    @avatar.save
    redirect_back(fallback_location: root_path)

  end

  def update
    @avatar.update(avatar_params)
    redirect_to profile_path(current_user.id)

    # (fallback_location: root_path)
  end

  private
    def set_avatar
      @avatar = Avatar.find(params[:id])
    end

    def avatar_params
      params.require(:avatar).permit(:username, :image, :remove_image)
    end
end
