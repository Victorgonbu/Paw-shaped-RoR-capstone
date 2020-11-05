module PostsHelper
  def paw_post_status(post)
    if post.goal < 1
      render '/posts/goal_completed', post: post if post.paws.any?
    else
      render '/posts/goal_in_progress', post: post
    end
  end

  def goal_status(post)
    render '/posts/goal_remaining' if post.goal.positive?
  end
end
