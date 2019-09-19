class SessionsController < ApplicationController


  def welcome
    @topics = Topic.last(5)
    @users = User.last(5)
    @posts = Post.order_by_updated.limit(10).most_upvoted
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
      flash[:error] = "Please check your email or password again"
      redirect_to '/login'
      #you must use redirect_to because if the user email has been found but no password provided
      #then @user is still populated when you render again..and form_for will think patch request.
      #even if you overwrite this with method = "/post" in form_for code it will still through think
      #it's an edit because @user is populated
    end
  end


  #omniauth login
    def fbcreate
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.username = auth['info']['name']
        u.email = auth['info']['email']
        u.password = SecureRandom.hex
      end
        session[:user_id] = @user.id
        redirect_to user_path(@user.id)
    end


  def destroy
    session.clear
    #current_user = nil
    redirect_to '/'
  end


  private
    def auth
      request.env['omniauth.auth']
    end

end
