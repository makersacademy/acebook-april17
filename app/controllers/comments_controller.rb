# frozen_string_literal: true

# This is a comments controller
class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(body: comment_params[:body],
                              post_id: params[:post_id],
                              user_id: session[:user_id])
    redirect_to '/posts'
  end

  def edit
    @comment = Comment.find(params[:id])
    if comment_not_authorised?
      prevent_edit('You can only edit your own comments')
    elsif comment_not_editable?
      prevent_edit('You can no longer edit this comment')
    end
  end

  def update
    @comment = Comment.find(params[:id])
    redirect_to posts_url if @comment.update(body: comment_params[:body])
  end

  def destroy
    @comment = Comment.find(params[:id])
    if comment_not_authorised?
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
