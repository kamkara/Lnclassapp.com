class ClassroomsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_classroom, only: %i[ show edit update destroy ]
  before_action :find_levels
  before_action :find_schools

  # GET /classrooms or /classrooms.json
  def index
    @classrooms =  Classroom.all.order(created_at: :desc)
  end

  # GET /classrooms/1 or /classrooms/1.json
  def show
  end

  # GET /classrooms/new
  def new
    @classroom = Classroom.new
  end

  # GET /classrooms/1/edit
  def edit
  end

  # POST /classrooms or /classrooms.json
  def create
    @classroom = current_user.classrooms.build(classroom_params)
    redirect_to classrooms_path(@classroom) and return if @classroom.save
    render :new
    

      @group = Group.new(group_params.merge({teacher: current_user}))
        redirect_to group_path(@group) and return if @group.save()
        render :new
  end

  # PATCH/PUT /classrooms/1 or /classrooms/1.json
  def update
    respond_to do |format|
      if @classroom.update(classroom_params)
        format.html { redirect_to @classroom, notice: "Classroom was successfully updated." }
        format.json { render :show, status: :ok, location: @classroom }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @classroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classrooms/1 or /classrooms/1.json
  def destroy
    @classroom.destroy
    respond_to do |format|
      format.html { redirect_to classrooms_url, notice: "Classroom was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classroom
      @classroom = Classroom.friendly.find(params[:id])
    end
    def find_levels
      @levels = Level.all
    end
    def find_schools
      #@school = School.all
    end

    # Only allow a list of trusted parameters through.
    def classroom_params
      params.require(:classroom).permit(:name, :slug, :level_id, :user_id)
    end
end
