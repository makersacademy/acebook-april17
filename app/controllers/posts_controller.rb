class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:destroy, :edit, :update, :upvote, :downvote]

  def create
    @post = current_user.posts.create(post_params)
    redirect_back(fallback_location: root_path)
  end

  def index
    @post = current_user.posts.create
    @posts = Post.order(:id).reverse
  end

  def destroy
    @post.destroy
    redirect_back(fallback_location: root_path)
  end

  def edit
    session[:prev_url] = request.referer
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to session[:prev_url], :notice => "Post has been updated"
    else
      render "edit"
    end
  end

  def upvote
    @post.upvote_from current_user
    redirect_back(fallback_location: root_path)
  end

  def downvote
    @post.downvote_from current_user
    redirect_back(fallback_location: root_path)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:message, :image)
  end
end
