class ApplicationController < ActionController::Base

  helper_method :current_user
  helper_method :title
  helper_method :show_question

  protected
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def title
    title = @question.title
  end

  def show_question
    show_question = @question.question_body
  end

end
