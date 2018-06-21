class PositionsController < ApplicationController
  before_action :set_position, only: [:show, :edit, :update, :destroy]

  # GET /positions/1
  # GET /positions/1.json
  def show
    @circle = params[:circle_id]
  end

  # GET /positions/new
  def new
    @position = Position.new
  end

  # GET /positions/1/edit
  def edit
  end

  # POST /positions
  # POST /positions.json
  def create
    @circle = position_params[:circle_id]
    @position = Position.new(position_params)

    respond_to do |format|
      if @position.save
        format.html { redirect_to circle_position_path(@circle, @position), notice: 'Position was successfully created.' }
        format.json { render :show, status: :created, location: @position }
      else
        format.html { render :new }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /positions/1
  # PATCH/PUT /positions/1.json
  def update
    @circle = position_params[:circle_id]

    respond_to do |format|
      if @position.update(position_params)
        format.html { redirect_to circle_position_path(@circle, @position), notice: 'Position was successfully updated.' }
        format.json { render :show, status: :ok, location: @position }
      else
        format.html { render :edit }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /positions/1
  # DELETE /positions/1.json
  def destroy
    @circle = params[:circle_id]

    @position.destroy
    respond_to do |format|
      format.html { redirect_to circle_path(@circle), notice: 'Position was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_position
      @position = Position.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def position_params
      params.require(:position).permit(:role_id, :circle_id, :user_id)
    end
end
