class UsersController < ApplicationController

  before_action :require_user, only: [:edit, :update]
  def new
    @user=User.new
  end

  def destroy
    @user=User.find(params[:id])
    if @user == current_user
      @user.destroy
      session[:user_id]=nil
      redirect_to articles_path
    end
  end
  def user_params
      params.require(:user).permit(:username, :email, :password)
  end

  def create
    @user=User.new(user_params)
    if @user.save
      session[:user_id]=@user.id
      flash[:notice]="Welcome to Alpha-Blog #{@user.username}"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
    @user=User.find(params[:id])
    if current_user!= @user
      flash[:notice] = "You can Only Edit Your Own Account"
      redirect_to @user
    end
  end

  def update
    @user =User.find(params[:id])
    if @user==current_user
      if @user.update(user_params)
        flash[:notice] ="Your Account is Updated"
        redirect_to @user
      else
        render 'edit'
      end
    end

  end

  def index
    @user= User.all
  end
  def show
    @user=User.find(params[:id])
    @articles=@user.articles
  end

end
  