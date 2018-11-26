# frozen_string_literal: true

# This is a comments controller
class CommentsController < ApplicationController
  def new
    # @comment = Comment.new(post_id: params[:post_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(body: comment_params[:body],
                              post_id: params[:post_id],
                              user_id: session[:user_id])
    redirect_to '/posts'
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user_id != current_user.id
      flash[:danger] = "You cannot delete someone else's comment"
    else
      @comment.destroy
      flash[:confirmation] = 'Comment deleted'
    end
    redirect_to posts_url
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
