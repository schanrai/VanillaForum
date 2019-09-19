class UpvotesController < ApplicationController

  def create
    @user = User.find(session[:user_id])
    @post = Post.find(params[:upvote][:post_id])
    params[:upvote][:user_id] = session[:user_id]
    @upvote = Upvote.new(upvote_params)
    if @upvote.save
      flash[:error] = "Post sucessfully upvoted"
      redirect_to topic_path(@post.topic)
    else
      @topic = @post.topic
      render "topics/show"
    end
  end



  private

    def upvote_params
      params.require(:upvote).permit(:user_id,:post_id)
    end

end
