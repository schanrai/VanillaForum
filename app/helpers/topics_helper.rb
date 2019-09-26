module TopicsHelper


  def not_upvoted_by_current_user?(post)
    a = post.upvotes.select { |upvote| upvote.user_id == current_user[:id] }
    a.empty?
  end

end
