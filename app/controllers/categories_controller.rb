class CategoriesController < ApplicationController
  def index
    @categories = Category.order(priority: :asc)

  end
  def show
    @category = Category.find(params[:id])
    @posts = Post.where(category_id: params[:id])
  end
end
