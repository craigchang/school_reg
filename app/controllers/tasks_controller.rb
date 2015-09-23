class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_enrollment_id, only: [:index, :show, :new, :edit]
  before_action :set_categories
  before_action :set_grades

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.where(enrollment_id: params[:enrollment_id])
    @course = @enrollment.course
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @enrollment = Enrollment.find(task_params[:enrollment_id])
    @task = @enrollment.tasks.build(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_path(enrollment_id: @enrollment.id), notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, locals: { enrollment_id: @enrollment.id } }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    @enrollment = Enrollment.find(task_params[:enrollment_id])

    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to tasks_path(enrollment_id: @enrollment.id), notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_grades
      @grades = [["Select one", ""], "A+", "A", "A-", "B+", "B", "B-", "C+", "C", "C-", "D", "F"]
    end

    def set_categories
      @categories = [["Select one", ""], "Homework", "Project", "Midterm", "Final Exam"]
    end

    def set_enrollment_id
      @enrollment = Enrollment.find(params[:enrollment_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:enrollment_id, :category, :name, :score, :max_score, :is_submitted, :grade)
    end
end
