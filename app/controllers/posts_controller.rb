class PostsController < ApplicationController
  include ApplicationHelper
  def new
    @post = Post.new
    @category_options = Category.all.map {|category| [ category.name, category.id ]}
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to post_path(@post), notice: 'Post successfully created'
    else
      flash.now[:alert] = 'Unable to create post'
      render :new
    end

  end

  def show
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:title, :description, :goal, :image, :category_id)
  end
end
