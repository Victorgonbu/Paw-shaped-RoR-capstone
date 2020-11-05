class PawsController < ApplicationController
  include ApplicationHelper
  before_action :require_login
  def create
    number = paw_params[:paws].to_i
    number.times do
      Paw.create(user_id: paw_params[:user_id])
    end
    redirect_back(fallback_location: root_path, notice: "#{paw_params[:paws]} paws purchased")
  end

  def update
    @paw = current_user.paws.take
    @post = Post.find(paw_params[:post_id])
    if @paw
      @paw.update(post_id: paw_params[:post_id])
      goal = @post.goal
      @post.update(goal: goal - 1)
      if @post.goal <= 0
        @post.update(category_id: 6)
        redirect_back(fallback_location: root_path, notice: 'Paw gifted, goal achieved!')
      else
        redirect_back(fallback_location: root_path, notice: 'Paw gifted')
      end

    else
      redirect_back(fallback_location: root_path, alert: 'Not enough paws :c')
    end
  end

  private

  def require_login
    redirect_back(fallback_location: root_path, alert: 'Must be logged in') unless current_user
  end

  def paw_params
    params.permit(:user_id, :paws, :post_id)
  end
end
