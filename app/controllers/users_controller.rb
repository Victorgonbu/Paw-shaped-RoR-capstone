class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: 'Sign up'
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
