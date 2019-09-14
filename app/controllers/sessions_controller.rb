class SessionsController < ApplicationController


  def welcome
    @topics = Topic.all
    @users = User.all
  end


  def new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    #current_user = nil
    redirect_to '/'
  end
end
