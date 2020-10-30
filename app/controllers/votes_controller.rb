class VotesController < ApplicationController
  def create
    @vote = Vote.new(vote_params)
    if @vote.save
      redirect_back(fallback_location: root_path, notice: 'You voted a post')
    else
      redirect_back(fallback_location: root_path, alert: 'Unable to vote post')
    end
  end

  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy
    redirect_back(fallback_location: root_path, notice: 'Post unvoted')
  end

  private

  def vote_params
    params.permit(:user_id, :post_id)
  end
end
