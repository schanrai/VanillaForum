module TopicsHelper


  def not_upvoted_by_current_user?(post)
    #post.upvotes.select { |upvote| upvote.user_id == current_user[:id] }.empty?
    post.upvotes.where("user_id = ? ", current_user[:id])
  end

  

end
