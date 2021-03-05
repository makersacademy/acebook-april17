class ProfilePostsController < ApplicationController
  def new
    @user = User.find(params[:user_profile_id])
    @profile_posts = current_user.profile_posts.build
  end

  def create
    @profile_post = current_user.profile_posts.build(post_params)
    user = User.find(@profile_post.user_profile_id)
    p params
    respond_to do |format|
      if @profile_post.save
        format.html { redirect_to user_path(user), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @profile_post }
      else
        format.html { render :new }
        format.json { render json: @profile_post.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @profile_post = ProfilePost.find(params[:id])
  end

  def show
    redirect_to posts_url
  end

  def update
    profile_post = ProfilePost.find(params[:id])
    profile_post.update(post_params)

    user = User.find(profile_post.user_profile_id)
    redirect_to(user_path(user))
  end

  def destroy
    profile_post = ProfilePost.find(params[:id])
    profile_post.destroy
    
    user = User.find(profile_post.user_profile_id)
    redirect_to(user_path(user))
  end

  private

  def post_params
    params.require(:profile_post).permit(:message, :user_id, :user_profile_id)
  end

end
