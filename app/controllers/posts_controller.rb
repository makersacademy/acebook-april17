# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :require_login

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(message: post_params[:message],
                        user_id: session[:user_id],
                        wall_id: params[:post][:wall_id])
    post_redirect
  end

  def index
    @posts = Post.all.order('updated_at DESC')
  end

  def edit
    @post = Post.find(params[:id])
    if not_authorised?
      prevent_edit('You can only edit your own posts')
    elsif not_editable?
      prevent_edit('You can no longer edit this post')
    end
  end

  def update
    @post = Post.find(params[:id])
    post_redirect if post_updated
  end

  def destroy
    @post = Post.find(params[:id])
    if not_authorised?
      flash[:danger] = "You cannot delete someone else's post"
    else
      @post.destroy
    end
    destroy_redirect
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

  def require_login
    prevent_view unless logged_in?
  end

  def post_redirect
    timeline_post? ? redirect_to(posts_url) : redirect_to(wall_url)
  end

  def destroy_redirect
    timeline_post_edited? ? redirect_to(posts_url) : redirect_to(edit_wall_url)
  end
end
