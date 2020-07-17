class UsersController < ApplicationController

  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new
    if params[:user][:password] != nil && params[:user][:name] != nil && (params[:user][:password] == params[:user][:password_confirmation])
      @user = User.create(u_params(:name, :password))
      session[:user_id] = @user.id
      redirect_to :homepage
    else
      flash.alert = "Please enter username and password!"
      redirect_to :new_user
    end
  end

  def homepage
  end

  def require_login
    return head(:forbidden) unless session.include? :user
  end

  private

  def u_params(*args)
    params.require(:user).permit(*args)
  end
end
