class PawsController < ApplicationController
  def create
    @paw = Paw.new(paw_params)
    if @paw.save
      redirect_back(fallback_location: root_path, notice: 'Paw gifted')
    else
      redirect_back(fallback_location: root_path, alert: 'Not enough paws :(')
    end
  end

  private

  def paw_params
    params.permit(:user_id, :post_id)
  end
end
