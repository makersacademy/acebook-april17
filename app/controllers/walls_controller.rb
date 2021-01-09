class WallsController < ApplicationController

  def show
    session[:wall_id] = params[:id]
    @user = User.find_by(id: params[:id])
    if Wall.find_by(id: params[:id]) == nil
      Wall.create(id: params[:id])
    end
    @wall = Wall.find_by(id: params[:id])

    if Post.find_by(wall_id: session[:wall_id]) == nil
      @posts = []
    else
      @posts = Post.where(wall_id: session[:wall_id])
    end
    # @posts = Wall.find_by(id: current_user.id)
  end

  def create
    post = Post.new(post_params)
    post.update(user_id: current_user.id, wall_id: session[:wall_id])
    post.save!

    redirect_to "/#{session[:wall_id]}"
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

end
