class PawsController < ApplicationController
  include ApplicationHelper
  def create
    number = paw_params[:paws].to_i
    number.times  do
        Paw.create(user_id: paw_params[:user_id])
    end
      redirect_back(fallback_location: root_path, notice: "#{paw_params[:paws]} paws purchased")
  end

  def update
    @paw = current_user.paws.take
    if @paw
      @paw.update(post_id: paw_params[:post_id])
      redirect_back(fallback_location: root_path, notice: 'Paw gifted')
    else
      redirect_back(fallback_location: root_path, alert: 'Not enough paws :c')
    end
  end

  private

  def paw_params
    params.permit(:user_id, :paws, :post_id)
  end
end
