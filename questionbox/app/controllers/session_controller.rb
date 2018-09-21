class SessionController < ApplicationController
  skip_before_action :verify_authentication
  def new
  end
  
  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to new_user_path
    else
      flash[:error_message] = "Invalid username or password."
      redirect_to questions_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've been logged out"
    redirect_to questions_path
  end

end
