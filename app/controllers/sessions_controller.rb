class SessionsController < ApplicationController
  def create
    # byebug
    @user = User.find_by(name: params[:user][:name])
    return head(:forbidden) unless @user.authenticate(params[:user][:password])

    session[:user_id] = @user.id
      # byebug
    end
end
