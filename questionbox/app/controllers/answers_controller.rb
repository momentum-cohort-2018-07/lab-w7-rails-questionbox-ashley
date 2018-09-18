class AnswersController < ApplicationController
    before_action :set_answer, only: [:show, :update, :destroy]
    
    def index
        @answers = Answer.all
        # @question = Question.find(params[:question_id])
    end
    
    def new
        # @question = Question.find(params[:id])
          if current_user
              @question = Question.find(params[:question_id])
              @answer = Answer.new
          else
            flash[:notice] = "You must be logged in to answer."
            redirect_to questions_path
          end
    end
    
    

    def show
        @answer = Answer.find(params[:id])
        @question = @questions.answers.build
    end

    def create
        if current_user
            @question = Question.find(params[:question_id])
            @answer = Answer.new(question_id: @question.id)
            respond_to do |format|
                if @answer.save
                    format.html { redirect_to answer_path, notice: 'Answer was successful.' }
                else
                    format.html { render :new }    
                end  
            end
        else
            redirect_to questions_path
        end
    end

    def update 
        respond_to do |format|
          if (answer_params[:question_validate_id] != nil && Answer.exists?(question_id: answer_params[:question_id]))
            format.html {redirect_to @answer.question}
          else
            if @answer.update({question_validate_id: nil}.merge(answer_params))
              format.html {redirect_to @answer.question, notice: 'Answer was successfully updated.'}
            else
              format.html {redirect_to @answer.question}
            end
          end
        end
    end
  
    def destroy 
      @answer.destroy
      respond_to do |format|
        format.html { redirect_to questions_path, notice: 'answer was successfully destructed.' }
      end
    end   


    private

        # def set_answer
        #     @answer = @question.answers.find(params[:id])
        # end
    
        def answer_params
            params.require(:answer).permit(:answer_body, :question_id, :user_id, :valid)
        end

end
