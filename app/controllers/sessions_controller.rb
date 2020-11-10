class SessionsController < ApplicationController
  include ApplicationHelper
  before_action :no_be_logged, only: %i[new create]
  def new; end

  def create
    user = User.find_by(name: params[:name])
    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: 'logged in'
    else
      flash.now[:alert] = 'Invalid name'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out'
  end

  private

  def no_be_logged
    redirect_back(fallback_location: root_path, alert: 'Already logged in') if current_user
  end
end
