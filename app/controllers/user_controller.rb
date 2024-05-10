class UserController < ApplicationController
  def show
    user = User.find(params[:id])
    if user.valid?
      render json: user
    else
      render json: user.errors, status: 422
    end
  end
end
