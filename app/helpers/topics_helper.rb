module TopicsHelper


def upvoted_by_current_user(post)

  post.upvotes.select { |upvote| upvote.user_id == current_user[:id] }
end

end
