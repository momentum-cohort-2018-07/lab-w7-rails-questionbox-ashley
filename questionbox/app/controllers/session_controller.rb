class SessionController < ApplicationController
  def new
  end
  
  def create
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
    else
    redirect_to questions_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to questions_path
  end

end
