class SessionController < ApplicationController
  
  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password_digest])
      session[:user_id] = user.user_id
    end
    redirect_to questions_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to questions_path
  end

end
