class ExercicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_exercice, only: %i[ show edit update destroy publish ]

  # GET /exercices or /exercices.json
  def index
    @exercices = Exercice.all
  end

  # GET /exercices/1 or /exercices/1.json
  
  def show
  end

  # GET /exercices/new
  def new
    @classroom = Classroom.friendly.find(params[:classroom_id])
    @exercice = @classroom.exercices.build()
  end

  # GET /exercices/1/edit
  def edit
  end

  # POST /exercices or /exercices.json
  def create
    #@exercice.user_id = current_user.id
    @exercice = current_user.exercices.build(exercice_params)
    redirect_to new_exercice_question_path(@exercice) and return if @exercice.save
    render :new
  end
  
  def publish
    @exercice = Exercice.frinedly.find(params[:id])
    redirect_to classroom_path(@exercice.classroom) and return if @exercice.update(published: true)
        
    flash.notice << [@exercice.errors.full_messages]
    redirect_back fallback_location: "/"
  end

  # DELETE /exercices/1 or /exercices/1.json
  def destroy
    @exercice.destroy
    redirect_to classroom_path(@exercice.classroom)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercice
      @exercice = Exercice.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exercice_params
      params.require(:exercice).permit(:name, :slug, :user_id, :classroom_id)
    end
end
