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
        
        respond_to do |f|
          if @user.save
            UserMailer.with(user: @user).answer_email.deliver_later

            format.html { redirect_to(@user, notice: 'User was successfully created.')}
            format.json { render json: @user, status: :created, location: @user}
          else
            format.html { render action: 'new' }
            format.json { reder json: @user.errors, status: :unprocessable_entity}
          end
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