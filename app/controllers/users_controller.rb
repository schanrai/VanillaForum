class UsersController < ApplicationController


  def new
    #binding.pry
    if logged_out?
      @user = User.new
    else
      flash[:error] = "You are already logged in"
      redirect_to user_path(session[:user_id])
    end
  end


  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end


  def show
    require_login
    @user = User.find(params[:id])
  end


  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :uid)
  end





end
