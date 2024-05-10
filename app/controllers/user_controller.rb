class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username)
  end
end
