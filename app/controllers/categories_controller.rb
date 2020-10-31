 class CategoriesController < ApplicationController
  def index
    @categories = Category.order(priority: :asc)
    @most_voted = Vote.group(:post_id).count(:all).max_by { |key, value| value }[0]
    @most_voted = Post.find(@most_voted)

  end
  def show
    @category = Category.find(params[:id])
    @posts = Post.where(category_id: params[:id])
  end
end
