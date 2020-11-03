class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: 'Sign up'
      session[:user_id] = @user.id
    else
      flash.now[:alert] = 'Invalid user'
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
