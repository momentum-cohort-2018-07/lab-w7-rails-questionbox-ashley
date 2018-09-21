class Api::V1::AnswersController < Api::V1::BaseController
    before_action :set_answer, only: [:destroy]
    before_action :set_user, only: [:destroy]
    skip_before_action :verify_authentication, only: [:index]
  
    def new
      if current_user
        @answer = Answer.new
      else
        redirect_to posts_path
      end
    end
  
    def index
  
      @answers = []
  
      Answer.all.each do |answer|
        if answer.question_id === Question.find(params[:question_id]).id
          @answers << answer
        end
      end
    end
  
    def create
      if current_user
        @answer = Answer.new(answer_params)
  
        if @answer.save
          render json: @answer, status: :created 
        else
          render json: @answer.errors, status: :unprocessable_entity
        end
      end
    end
  
    def destroy
      if current_user === @user
        @answer.destroy
        render json: @answer, status: :destroyed
      else
    
        render json: @answer.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def set_answer
      @answer = Answer.find(params[:id])
    end
  
    def set_user
      ctest = Answer.find(params[:id]).user_id
      @user = User.find(ctest)
    end
  
    def answer_params
      params.require(:answer).permit(:body, :user_id, :question_id)
    end
end