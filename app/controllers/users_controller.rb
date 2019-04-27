class UsersController < ApplicationController
  before_action :find_user, only: [:show]

  def index
    @users = User.all
  end

  def login_form
    @user = User.new
  end

  def login
    username = params[:user][:username]

    user = User.find_by(username: username)
    unless user
      # new user
      user = User.create(username: username)
    end

    session[:user_id] = user.id

    flash[:status] = :success
    flash[:message] = "Successfully logged in as user #{user.username}"

    redirect_to root_path
  end

  def logout
    session[:user_id] = nil

    flash[:status] = :success
    flash[:message] = "Successfully logged out"

    redirect_to root_path
  end

  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.new(user_params)

  #   successful = @user.save

  #   if successful
  #     flash[:status] = :success
  #     flash[:message] = "User added successfully"
  #     redirect_to user_path(@user.id)
  #   else
  #     flash.now[:status] = :error
  #     flash.now[:message] = "User could not be added/logged in."
  #     render :new, status: :bad_request
  #   end
  # end

  # def show ; end
  # def edit ; end

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
