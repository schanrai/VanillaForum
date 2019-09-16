class SessionsController < ApplicationController


  def welcome
    @topics = Topic.all
    @users = User.all
  end


  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = "Sorry, your username or password was incorrect"
      redirect_to '/login'
      #you must use redirect_to because if the user email has been found but no password provided
      #then @user is still populated when you render again..and form_for will think patch request.
      #even if you overwrite this with method = "/post" in form_for code it will still through think
      #it's an edit because @user is populated
    end
  end

  def destroy
    session.clear
    #current_user = nil
    redirect_to '/'
  end
end
