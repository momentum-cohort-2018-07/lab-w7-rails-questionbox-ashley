class Api::V1::QuestionsController < ApplicationController
    before_action :set_question, only: [:show, :update, :destroy, :set_user]
    before_action :set_user, only: [:destroy]
    skip_before_action :verify_authentication, only: [:index]
    
    # GET /questions
    # GET /questions.json
    def index
      @questions = Question.all
    end
  
    # GET /questions/1
    # GET /questions/1.json
    def show
    end
  
    # POST /questions
    # POST /questions.json
    def create
      @question = Question.new(question_params)
  
      if @question.save
        render json: @question, status: :created 
      else
        render json: @question.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /questions/1
    # DELETE /questions/1.json
    def destroy
      if current_user === @user
        @question.destroy
        render json: @question, status: :destroyed
      else
    
        render json: @question.errors, status: :unprocessable_entity
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_question
        @question = Question.find(params[:id])
      end
  
      def set_user
        btest = Question.find(params[:id]).user_id
        @user = User.find(btest)
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def question_params
        params.require(:question).permit(:title, :question_body, :user_id)
      end
end
  