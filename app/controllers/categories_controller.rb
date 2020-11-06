class CategoriesController < ApplicationController
  def index
    @categories = Category.ordered
    if Vote.any?
    @most_voted = Vote.most_liked
    @most_voted = Post.find(@most_voted)
    end
  end

  def show
    @category = Category.find(params[:id])
    @posts = Post.includes(%i[category user]).where(category_id: params[:id]).order(created_at: :desc)
  end
end
