class AnswersController < ApplicationController
    before_action :set_answer, only: [:show, :update, :destroy]
    
    def index
        @question = Question.find(params[:question_id])
    end
    
    def new
        if current_user
            @answer = Answer.new
        else
            redirect_to questions_path, notice: 'MUST BE LOGGED IN TO ANSWER A QUESTION'
        end
    end

    def show
        @answer = Answer.find(params[:id])
    end

    def create
        if current_user
            @answer = Answer.new(answer_params)
            @answer.valid = false
            respond_to do |format|
                if @answer.save
                    question_id = @answer.question_id
                    user_id = ''
                    email = ''
                      @question = Question.find_by("id = ?", question_id)
                      user_id = @question.user_id
                      @user2 = User.find_by("id = ?", user_id)
                      UserMailer.newanswer(@user2).deliver_now
                    format.html { redirect_to questions_path, notice: 'Answer was successful.' }
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

        def set_answer
            @answer = Answer.find(params[:id])
        end
    
        def answer_params
            params.require(:answer).permit(:answer_body, :question_id, :user_id, :valid)
        end

end
