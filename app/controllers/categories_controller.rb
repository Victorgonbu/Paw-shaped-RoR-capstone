class CategoriesController < ApplicationController
  def index
    @categories = Category.all.where.not(id: Category.first.id)
    @principal = Category.first
  end
end
