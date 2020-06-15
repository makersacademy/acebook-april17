class FriendsController < ApplicationController

  def new
  end

  def create
    @friend = Friend.create( { requester: params[:friend][:requester],
      parent_friend: params[:friend][:parent_friend] } )
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @friend = Friend.find_by( { requester: params[:friend][:requester],
      parent_friend: params[:friend][:parent_friend] } )
    @friend.destroy
    redirect_back(fallback_location: root_path)

  end

end
