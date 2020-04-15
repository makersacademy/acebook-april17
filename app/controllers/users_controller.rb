class UsersController < ApplicationController
  def index
    @users = User.all
    if User.exists?(id: session[:current_user])
      @user = User.find(session[:current_user])
    else
      @user = nil
    end
  end

  def new_user
  end

  def logout
    session[:current_user] = nil
    redirect_to '/'
  end

  def auth
    if User.exists?(email: params[:email])
      user = User.find_by email: params[:email]
      if params[:password] == user.password
        session[:current_user] = user.id
        redirect_to '/home'
      else
        flash[:notice] = "Wrong email or password, you silly fool!"
        redirect_to '/'
      end
    else
      flash[:notice] = "Wrong email or password, you silly fool!"
      redirect_to '/'
    end
   
  end

  def create_a_user
    if User.exists?(email: params[:email])
      flash[:notice] = 'An account with that email already exists'
      redirect_to '/sign-up'
    else
      user = User.create({
        name: params[:fullname],
        dob: params[:dob],
        cob: params[:cob],
        mob: params[:mob],
        email: params[:email],
        password: params[:password]
      })
      user.save
      session[:current_user] = user.id
      redirect_to '/home'
    end
  end

  
  def edit
    @user = User.find(session[:current_user])
  end
  
  def update_user
    user = User.find(session[:current_user])
    user.update({
      name: params[:fullname],
      dob: params[:dob],
      cob: params[:cob],
      mob: params[:mob],
      email: params[:email],
      password: params[:password]
    })
    user.save
    redirect_to '/home'
  end
  
  def destroy_user
    user = User.find(session[:current_user])
    user.destroy
    session[:current_user] = nil
    redirect_to '/'
  end

  def timeline
    @user = User.find(params[:id])
    @posts = Post.where(:poster_id => @user.id)
    @comments = Comment.all
    @profilepicture = Profilepicture.last
  end

end