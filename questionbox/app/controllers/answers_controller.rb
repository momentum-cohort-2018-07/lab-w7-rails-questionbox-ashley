class AnswersController < ApplicationController

    def new
        @answer = Answer.new
    end

    def index
        @answers = Answer.all
    end

    def create
        @answer = Answer.new(answer_params)
        respond_to do |format|
            if @answer.save
                format.html { redirect_to root_path, notice: 'Comment was successfully created.' }
            else
                format.html { render :new }    
            end  
        end
    end

    private
    
        def set_answer
            @answer = answer.find(params[:id])
        end

    
        def answer_params
            params.require(:answer).permit(:question_id, :body, :user_id)
        end

end
