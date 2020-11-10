class PostsController < ApplicationController
  include ApplicationHelper
  before_action :require_login, only: %i[new create]
  def new
    @post = Post.new
    @category_options = Category.all.map { |category| [category.name, category.id] }
  end

  def create
    @category_options = Category.all.map { |category| [category.name, category.id] }
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to post_path(@post), notice: 'Post successfully created'
    else
      flash.now[:alert] = 'Unable to create post'
      render :new
    end
  end

  def show
    @post = Post.includes(%i[votes paws user category]).find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :goal, :image, :category_id)
  end

  def require_login
    return if current_user

    flash[:alert] = 'You must be logged in to create a new post'
    redirect_to root_path
  end
end
