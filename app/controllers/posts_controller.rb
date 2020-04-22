# frozen_string_literal: true
class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to posts_url
  end

  def update
    @post = Post.find(params[:id])
      if @post.update_attributes(post_params)
        # .require(:post).permit(:message, :image)
          redirect_to action: :index
          flash[:notice] = 'post was updated.'
      else
          render 'edit'
      end
    end    

    def edit
      @post = Post.find(params[:id])
    end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    Post.find(delete_params).destroy
    # @post.destroy
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message, :time, :user_id)
  end

  def delete_params
    params.require(:id)
  end
end 