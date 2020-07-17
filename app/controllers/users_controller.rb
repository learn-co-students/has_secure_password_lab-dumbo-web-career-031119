class UsersController < ApplicationController
  def create
    @user = User.create(user_params)
    # byebug
    if params[:user][:password] == params[:user][:password_confirmation]
      session[:user_id] = @user.id
    else
      redirect_to '/users/new'
    end
  end

  def new
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
