class ProfilesController < ApplicationController
  before_action :authenticate_user!


respond_to :html

  def index
    @profile = User.find(current_user.id)
    @users = User.all
    @friends = Friend.where requester: @profile.username
    @posts = Post.last(10)
    @like = Like.new
    respond_with(@users)
  end

  def show
    @profile = User.find(params[:id])
    @post = Post.new
    @posts = Post.where recipient_username: @profile.username
    @bio = Bio.new
    @bio_profile = Bio.find_by(bio_username: @profile.username)
    @friend = Friend.new
    @friends = Friend.where requester: @profile.username
    @like = Like.new
    @avatar = Avatar.new
    if Avatar.find_by(username: @profile.username) == nil
      @avatar_profile = Avatar.create({
        "image" => File.open(File.join(Rails.root, "app/assets/default.png")),
        "username" => @profile.username })
    else
      @avatar_profile = Avatar.find_by(username: @profile.username)
    end
  end

  def createpost
  end

  def new
    @profile = Profile.new
  end

  def edit
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    @profile.save
    respond_with(@profile)
  end

  def update
    @posts = Post.all

    # @profile.profile(profile_params)
  end

  def destory
    @profile.destroy
  end


  private

    def default_url
      ActionController::Base.helpers.asset_path("/default/default.png")
    end

end
