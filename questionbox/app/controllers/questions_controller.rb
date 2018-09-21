class QuestionsController < ApplicationController
  skip_before_action :verify_authentication
  before_action :set_question, only: [:show, :update, :destroy]
  before_action :set_user, only: [:new, :show]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.page(params[:page])
    # @questions = Question.all(params[:id])
  end

  # def my_questions
  #   @questions = Question
  #   .group(:id)
  #   .where(user_id: current_user.id)
  # end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
  end

  # GET /questions/new
  def new
    if current_user
      @question = Question.new
    else
      redirect_to questions_path, notice: 'MUST BE LOGGED IN TO CREATE A QUESTION'
    end
  end

  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])
    unless current_user.id == @question.user_id
      redirect_to questions_path 
    end
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    respond_to do |format|
      if @question.save
        format.html { redirect_to questions_root_path, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    if current_user.id == @question.user_id
      respond_to do |format|
        if @question.update(question_params)
          format.html { redirect_to root_path, notice: 'Question was successfully updated.' }
          format.json { render :show, status: :ok, location: @question }
        else
          format.html { render :edit }
          format.json { render json: @question.errors, status: :unprocessable_entity }
        end
    end
      else
        redirect_to questions_path
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:question_id] || params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title, :question_body, :user_id, :image)
    end
end

