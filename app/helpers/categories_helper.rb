module CategoriesHelper
  def index
    @index ||= 0
  end

  def counter
    @counter ||= 0
  end

  def revert(size)
    index == 6 ? @index = 1 : @index += 1
    counter
    @counter += 1
    if size == @counter
      value = @index
      @index = 0
      @counter = 0
      value
    else
      @index
    end
  end

  def render_post_grid(posts, post)
    if revert(posts.size) < 4
      render 'post', post: post
    else
      render 'inverted_post', post: post
    end
  end

  def render_goal_setter(post)
    render 'goal_setter', post: post if post.goal.positive?
  end

  def render_user_interactions(post)
    render '/posts/interaction', post: post if current_user
  end

  def most_liked_in_category(category)
    post_array ||= category.votes.group(:post_id).count(:all).max_by { |_key, value| value }
    if post_array
      Post.find(post_array[0])
    elsif (post = category.posts.first)
      post
    end
  end

  def render_most_voted_post_in(category)
    post = most_liked_in_category(category)
    render 'most_liked_posts', post: post if post
  end

  def paws(post)
    link_to(user_paw_path(post_id: post.id, user_id: current_user.id), method: :patch, class: 'paw-button') do
      content_tag(:i, '', class: 'fas fa-paw paw')
    end
  end

  def votes(post)
    @vote = post.votes.find_by(user_id: current_user.id)
    if @vote

      link_to(post_vote_path(id: @vote.id, post_id: post.id), method: :delete) do
        content_tag(:i, '', class: 'fas fa-star unvote')
      end

    else
      link_to(post_votes_path(post_id: post.id, user_id: current_user.id), method: :post) do
        content_tag(:i, '', class: 'fas fa-star vote')
      end
    end
  end

  def most_voted_post(most_voted)
    render 'most_voted' if most_voted
  end
end
