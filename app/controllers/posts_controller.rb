class PostsController < ApplicationController
  respond_to :js, :html, :json
  before_action :authenticate_user!
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_url
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @post = Post.new
    @posts = Post.all
    @comment = Comment.new(post_id: params[:post_id])
  end

  def like
    @post = Post.find(params[:id])
    @post.liked_by current_user
    redirect_back fallback_location: root_path
  end

  def unlike
    @post = Post.find(params[:id])
    @post.unliked_by current_user
    redirect_back fallback_location: root_path
  end

  private

  def post_params
    params.require(:post).permit(:message, :user_id).merge(user_id: current_user.id)
  end
end
