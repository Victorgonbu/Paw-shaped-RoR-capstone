 class CategoriesController < ApplicationController
  def index
    @categories = Category.ordered
    @most_voted = Vote.most_liked
    @most_voted = Post.find(@most_voted)


  end
  def show
    @category = Category.find(params[:id])
    @posts = Post.where(category_id: params[:id]).order(created_at: :desc)
    created_at =
    @accomplished = Post.where(goal: 0)
  end
end
