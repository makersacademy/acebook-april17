class ProfileController < ApplicationController
  
  def index
    @user = User.find_by_id(params[:id])
    id = @user.id
    @posts = Post.all
  end

end
