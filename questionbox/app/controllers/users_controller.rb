class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def show
        @user = User.find(params[:id])
    end

    def create
        @user = User.new(user_params)
        if @user.save
          UserMailer.signup(@user).deliver_now
          redirect_to @user
        else
          render new_user_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :username, :password, :password_confirmation, :email)
    end

end