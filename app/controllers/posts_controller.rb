class PostsController < ApplicationController

  def new
    #check if it actually exists, prevents user manupulation
      if set_topic && current_user
        @post = @topic.posts.build
    else
      flash[:error] = "You must create a post within an existing thread."
    end
  end


  def create
    set_topic
    @post = current_user.posts.build(post_params)
    @post.topic_id = params[:topic_id]
    if @post.save
      flash[:error] = "Post created sucessfully"
      redirect_to topic_path(@post.topic_id)
    else
      flash[:error] = "Post creation failed. Try again"
      render :new
    end
  end


  def index
    require_login
    @user = User.find_by_id(params[:user_id])
    if @user.posts.exists?
      @posts = @user.posts
    else
      flash[:error] = "#{@user.username}has not posted as yet"
      redirect_to user_path(@user)
    end
  end



private

  def post_params
    params.require(:post).permit(:body)
  end

  def set_topic
    @topic = Topic.find_by_id(params[:topic_id])
  end


end
