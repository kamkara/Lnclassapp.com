class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question, only: %i[ show edit update destroy ]

  # GET /questions or /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1 or /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @exercice = Exercice.friendly.find(params[:exercice_id])
    @question = Question.new
    3.times { @question.answers.build}
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions or /questions.json
  def create
    @question = Question.create(question_params)
    redirect_to new_exercice_question_path(@question.exercice) and return if @question.valid?
    @exercice = @question.exercice    
    render :new
  end


  # PATCH/PUT /questions/1 or /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: "Question was successfully updated." }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    @question = Question.find(params[:id])
    authorize @question, :destroy?
    @question.destroy
    redirect_to new_exercice_question_path(params[:exercice_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:exercice_id, :content, :explain_answer, :answers_attributes => {})
    end
end