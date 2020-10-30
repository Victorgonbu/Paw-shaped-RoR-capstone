class PawsController < ApplicationController
  def create
    number = paw_params[:paws].to_i
    number.times  do
        Paw.create(user_id: paw_params[:user_id])
    end
      redirect_back(fallback_location: root_path, notice: "#{paw_params[:paws]} paws purchased")
  end

  def update
    
  end

  private

  def paw_params
    params.permit(:user_id, :paws)
  end
end
