class SessionsController < ApplicationController
  def new

  end
  def create
    user =User.find_by(email:params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id]=user.id
      flash[:notice] = "LogIN Successfully"
      redirect_to user
    else
      flash.now[:alert] = "Incorrect Credentials"
      render 'new'
    end
  end
  def destroy
    session[:user_id]=nil
    redirect_to root_path
  end
end