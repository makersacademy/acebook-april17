class LikesController < ApplicationController

  def new
  end

  def create
    likes = {profile_id: current_user.id, post_id: params[:like][:post_id]}
    @like = Like.create(likes)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    like = Like.find_by(profile_id: current_user.id, post_id: params[:like][:post_id])
    like.destroy
    redirect_back(fallback_location: root_path)
  end

end
