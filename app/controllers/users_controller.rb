class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to the chatroom #{@user.username}, you have successfully signed up."
      redirect_to root_path
    else
      redirect_to signup_path
      flash[:error] = "Please fill in both fields before attempting to create your account!"
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

end
