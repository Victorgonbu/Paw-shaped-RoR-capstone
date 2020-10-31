 class CategoriesController < ApplicationController
  def index
    @categories = Category.order(priority: :asc)
    @most_voted = Vote.most_liked
    @most_voted = Post.find(@most_voted)


  end
  def show
    @category = Category.find(params[:id])
    @posts = Post.where(category_id: params[:id])
  end
end
