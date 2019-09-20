class FriendshipsController < ApplicationController
  before_action :check_friendship, only: :create

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      redirect_to request.referrer
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    redirect_to user_path(current_user.id)
  end

  private
    def check_friendship
      redirect_to(current_user, alert: "Already a friend") if current_user.friend_with?(params[ :friend_id ])
    end
end
