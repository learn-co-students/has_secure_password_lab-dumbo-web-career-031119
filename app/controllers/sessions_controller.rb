class SessionsController < ApplicationController
    helper_method :access

    def new
    end

    def create
        @user = User.find_by(name: params[:user][:name])
        return head(:forbidden) unless @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
    end

    def access
        session[:user_id]
    end
end