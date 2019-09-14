class TopicsController < ApplicationController

  def welcome

    @topics = Topic.all
  end
end
