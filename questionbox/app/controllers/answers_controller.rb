class AnswersController < ApplicationController

    def new
        if current_user
            @answer = Answer.new
        else
            redirect_to questions_path
        end
    end

    def index
        @answers = Answer.all
    end

    def create
        if current_user
            @answer = Answer.new(answer_params)
            respond_to do |format|
                if @answer.save
                    format.html { redirect_to root_path, notice: 'Answer was successful.' }
                else
                    format.html { render :new }    
                end  
            end
        else
            redirect_to questions_path
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
