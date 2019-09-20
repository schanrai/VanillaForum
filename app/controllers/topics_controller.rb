class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :most_upvoted]


  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
    @topic.posts.new
  end


  def create
    @topic = current_user.topics.new(topic_params)
    @topic.posts.first.user_id = current_user.id
    flash[:error] = "Post created sucessfully"
      if @topic.save
        flash[:error] = "Post creation failed. Try again"
        redirect_to topic_path(@topic)
      else
        render :new
      end
  end


  def show
  end

  def most_upvoted
  end


  private


    def set_topic
      @topic = Topic.find(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:title, posts_attributes: [:body])
    end

end
