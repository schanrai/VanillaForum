module TopicsHelper


  def not_upvoted_by_current_user?(post)
    post.upvotes.select { |upvote| upvote.user_id == current_user[:id] }.empty?
    #use .where because it will only evaluate according to condition, try and make it only evaluate 
  end

end
