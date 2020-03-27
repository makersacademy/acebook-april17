module Api 
  module V1
    class PostsController < ApplicationController
      def new
        @post = Post.new
      end

      def create
        @post = Post.create(post_params)
        @post.save

        redirect_to posts_url
      end

      def show
        @post = Post.find(params[:id])
        render json: @post
      end

      def index
        @posts = Post.all
        render json: @posts
      end

      def edit
        @post = Post.find(params[:id])
      end

      def update
        @post = Post.find(params[:id])
        if @post.created_at > 10.minutes.ago
          if(@post.update(post_params))
              redirect_to @post
          else
            render 'edit'
          end
        else 
          flash[:alert] = "Posts can only be updated within 10 minutes of creation"
          redirect_to @post
        end
      end

      def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
      end

      private

      def post_params
        params.require(:post).permit(:message, :user_id, :wall_id).merge(user_id: current_user.id)
      end


    end
  end
end
