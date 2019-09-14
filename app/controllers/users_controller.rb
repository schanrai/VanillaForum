class UsersController < ApplicationController

  def new
    @user = User.new
  end


  def create
    @user = User.create(user_params)
    render 'new' unless @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end


  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :uid)
  end

end
