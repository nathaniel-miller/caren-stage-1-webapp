class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @in_circle = !!params[:circle_id] #for menu
    @circle = params[:circle_id]
    @tasks = Task.where("circle_id = ?", params[:circle_id])
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @in_circle = !!params[:circle_id] #for menu
    @circle = params[:circle_id]
  end

  # GET /tasks/new
  def new
    @in_circle = !!params[:circle_id] #for menu
    @circle = params[:circle_id]
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
    @in_circle = !!params[:circle_id] #for menu
    @circle = params[:circle_id]
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @circle = task_params[:circle_id]

    respond_to do |format|
      if @task.save
        format.html { redirect_to circle_task_path(@circle, @task), notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    @circle = task_params[:circle_id]

    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to circle_task_path(@circle, @task), notice: 'Task was successfully updated.' }
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
      format.html { redirect_to circle_tasks_path, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:description, :expiration_date, :completed, :completed_by_id, :category_id, :created_by_id, :task_generator_id, :circle_id)
    end
end
