class TaskGeneratorsController < ApplicationController
  before_action :set_task_generator, only: [:show, :edit, :update, :destroy]

  # GET /task_generators
  # GET /task_generators.json
  def index
    @circle = params[:circle_id]
    @task_generators = TaskGenerator.all
  end

  # GET /task_generators/1
  # GET /task_generators/1.json
  def show
  end

  # GET /task_generators/new
  def new
    @task_generator = TaskGenerator.new
  end

  # GET /task_generators/1/edit
  def edit
  end

  # POST /task_generators
  # POST /task_generators.json
  def create
    @circle = task_generator_params[:circle_id]
    @task_generator = TaskGenerator.new(task_generator_params)

    respond_to do |format|
      if @task_generator.save
        format.html { redirect_to circle_task_generator_path(@circle, @task_generator), notice: 'Task generator was successfully created.' }
        format.json { render :show, status: :created, location: @task_generator }
      else
        format.html { render :new }
        format.json { render json: @task_generator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_generators/1
  # PATCH/PUT /task_generators/1.json
  def update
    @circle = task_generator_params[:circle_id]

    respond_to do |format|
      if @task_generator.update(task_generator_params)
        format.html { redirect_to circle_task_generator_path(@circle, @task_generator), notice: 'Task generator was successfully updated.' }
        format.json { render :show, status: :ok, location: @task_generator }
      else
        format.html { render :edit }
        format.json { render json: @task_generator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_generators/1
  # DELETE /task_generators/1.json
  def destroy
    @task_generator.destroy
    respond_to do |format|
      format.html { redirect_to circle_task_generators_path, notice: 'Task generator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_generator
      @task_generator = TaskGenerator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_generator_params
      params.require(:task_generator).permit(:description, :category_id, :circle_id, :created_by, :mandatory, :every_n, :sun, :mon, :tues, :wed, :thurs, :fri, :sat, :part_of_day, :custom_time, :last_run, :look_ahead)
    end
end
