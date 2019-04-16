class UsersController < ApplicationController

    def index
        @user = User.all
    end

    def new
    end

    def create
        User.create(user_params)
    end


private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
