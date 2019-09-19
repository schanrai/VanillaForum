class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :most_upvoted]


  def index
    @topics = Topic.all
  end

  def show
  end

  def most_upvoted
  end


  private


    def set_topic
      @topic = Topic.find(params[:id])
    end

end
