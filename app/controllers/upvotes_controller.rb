class UpvotesController < ApplicationController

  def create
    params[:upvote][:user_id] = session[:user_id]
    @user = User.find(session[:user_id])
    #store user in @user for show page where redirected to
    #creates a ride with user_id and attraction_id attributes (always built off attraction?)
    @upvote = Upvote.new(upvote_params)
    #runs the take_ride method on the associated objects
    if @upvote.save
      flash[:error] = "Post sucessfully upvoted"
      redirect_to user_path(@user)
    end
  end



  private

    def upvote_params
      params.require(:upvote).permit(:user_id,:post_id)
    end

end
