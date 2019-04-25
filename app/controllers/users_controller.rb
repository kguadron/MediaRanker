class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
  end

  def create
  end

  # def show ; end
  # def edit ; end

  def update
  end

  def destroy
  end

  private

  def user_params
    return params.require(:user).permit(:username)
  end

  def find_user
    @user = User.find_by(id: params[:id])

    unless @user
      head :not_found
      return
    end
  end
end
