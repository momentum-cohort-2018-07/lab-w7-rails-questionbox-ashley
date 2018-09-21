class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authentication, only: [:create]
  # before_action :set_user, only: [:show, :destroy, :update]

    def new
      @user = User.new
    end
  
  
    def create
      @user = User.new(user_params)
  
      if @user.save
          render json: @user, status: :created 
        else
          render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    #def update
    #end
  
    def destroy
      User.find(params[:id]).destroy
    end
  
    def user_params
      params.require(:users).permit(:username, :email, :password_digest, :password_confirmation)
    end
end