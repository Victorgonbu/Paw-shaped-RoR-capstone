class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(name: params[:name])
    if user
      session[:user_id] = user.id
      redirect_to users_path, notice: 'logged in'
    else
      flash.now[:alert] = "Invalid name"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out'
  end
end
