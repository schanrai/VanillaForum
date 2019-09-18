class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit]

  def index
    @topics = Topic.all
  end

  def show
    
  end


  private

    #def order_by_upvotes
    #end

    def set_topic
      @topic = Topic.find(params[:id])
    end

end
