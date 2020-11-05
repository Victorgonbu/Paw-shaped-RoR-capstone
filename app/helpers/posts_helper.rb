module PostsHelper
  def paw_post_status(post)
    if post.goal < 1 && post.paws.any?
      render '/posts/goal_completed', post: post
    else
      render '/posts/goal_in_progress', post: post
    end
  end

  def goal_status(post)
    render '/posts/goal_remaining' if post.goal > 0
  end
end
