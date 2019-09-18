class PostsController < ApplicationController

  def new
    #check if it actually exists, prevents user manupulation
      if @topic = Topic.find_by_id(params[:topic_id])
        @post = @topic.posts.build
    else
      flash[:error] = "You must create a post within a thread"
    end
  end


  def create
    @topic = Topic.find_by_id(params[:topic_id])
    @post = current_user.posts.build(post_params)
    @post.topic_id = params[:topic_id]
    if @post.save
      redirect_to topic_path(@post.topic_id)
      #or just @post.topic_id
    else
      #@post.build_topic unless @post.topic
      render :new
    end
  end


private

  def post_params
    params.require(:post).permit(:body)
  end


end
