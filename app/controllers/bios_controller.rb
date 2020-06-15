class BiosController < ApplicationController
  before_action :set_bio, only: [:show, :edit, :update, :destroy]


  def index
    @bios = Bio.all
  end


  def show
  end

  def new
    @bio = Bio.new
  end

  def edit
    @profile = User.find(params[:profile_id])
  end

  def create
    @bio = Bio.create({age: params[:bio][:age], bio: params[:bio][:bio], location: params[:bio][:location], bio_username: params[:bio][:bio_username]})
    redirect_back(fallback_location: root_path)
  end

  def update
    @bio.update({age: params[:bio][:age], bio: params[:bio][:bio], location: params[:bio][:location], bio_username: params[:bio][:bio_username]})
    redirect_to profile_path(params[:profile_id])
  end

  def destroy
  end

  private
    def set_bio
      @bio = Bio.find(params[:id])
    end
end
