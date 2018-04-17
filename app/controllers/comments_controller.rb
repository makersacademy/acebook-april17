class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    comment_hash = comment_params.merge(user_id: current_user.id)
    @comment = @post.comments.create(comment_hash)
    # 20.times { p @post }
    redirect_to posts_path
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :post_id)
  end
end
