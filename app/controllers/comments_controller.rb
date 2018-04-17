class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post
  before_action :find_comment, only: [:destroy]

  def create
    @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end


  def destroy
    if (not_their_comment)
      flash[:notice] = "This is not your comment"
    else
      @comment.destroy
    end
    redirect_to post_path(@post)
  end

  private
  def find_post
    @post = Post.find(params[:post_id])
  end

  def not_their_comment
    current_user.id.to_i != @comment.user_id.to_i
  end

  def find_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params[:comment].permit(:content).merge(user_id: current_user.id)
  end

end
