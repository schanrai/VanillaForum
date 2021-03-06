class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :most_upvoted]


  def index
    @topics = Topic.all
  end

  def new
    if current_user
      @topic = Topic.new
      @topic.posts.new
    else
      flash[:error] = "You must be logged in to do that."
      redirect_to '/login'
    end
  end


  def create
    @topic = current_user.topics.new(topic_params)
    @topic.posts.first.user_id = current_user.id
    flash[:error] = "Topic creation failed. Try again"
      if @topic.save
        flash[:error] = "Topic created sucessfully"
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
      @topic = Topic.find_by_id(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:title, posts_attributes: [:body])
    end



end
