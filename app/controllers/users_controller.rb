class UsersController < ApplicationController
  def new
    @user=User.new
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
  end

  def update
    @user =User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] ="Your Account is Updated"
      redirect_to @user
    else
      render 'edit'
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
  