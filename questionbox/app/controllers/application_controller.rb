class ApplicationController < ActionController::Base
    include ActionController::HttpAuthentication::Token::ControllerMethods
  protect_from_forgery with: :null_session
  helper_method :current_user
  helper_method :title
  helper_method :api_token
  helper_method :show_question
  before_action :verify_authentication

  protected
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def verify_authentication
    user = authenticate_with_http_token do |token, options|
      User.find_by_api_token(token)
    end

    unless user
      render json: { error: "You don't have permission to access these resources."}
    end
  end

  def title
    title = @question.title
  end

  def show_question
    show_question = @question.question_body
  end

end
