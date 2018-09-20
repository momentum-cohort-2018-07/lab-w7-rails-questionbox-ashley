class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def show
        @user = User.find(params[:id])
        @questions = @user.questions
    end

    def create
        @user = User.new(user_params)
        if @user.save
        #   UserEmail.signup(@user.email).deliver_now
          redirect_to @user
        else
          render new_user_path
        end
    end

    private

    def set_user
        @user = User.new(user_params) 
    end

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation, :email)
    end

end