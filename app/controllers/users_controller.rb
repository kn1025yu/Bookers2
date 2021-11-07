class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    unless  @user == current_user
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user), notice:'successfully'
    else
    flash.now[:alert] = 'unsuccessfully'
    render :edit
    end
  end

  def followings
    @user = User.find(params[:id])
    @users = @user.followings
    render 'follow_user'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render 'follower_user'
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end


end
