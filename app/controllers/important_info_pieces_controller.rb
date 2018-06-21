class ImportantInfoPiecesController < ApplicationController
  before_action :set_important_info_piece, only: [:show, :edit, :update, :destroy]

  # GET /important_info_pieces
  # GET /important_info_pieces.json
  def index
    @in_circle = !!params[:circle_id] #for menu
    @circle = params[:circle_id]
    @important_info_pieces = ImportantInfoPiece.where("circle_id = ?", params[:circle_id])
  end

  # GET /important_info_pieces/1
  # GET /important_info_pieces/1.json
  def show
  end

  # GET /important_info_pieces/new
  def new
    @important_info_piece = ImportantInfoPiece.new
  end

  # GET /important_info_pieces/1/edit
  def edit
  end

  # POST /important_info_pieces
  # POST /important_info_pieces.json
  def create
    @circle = important_info_piece_params[:circle_id]
    @important_info_piece = ImportantInfoPiece.new(important_info_piece_params)

    respond_to do |format|
      if @important_info_piece.save
        format.html { redirect_to circle_important_info_piece_path(@circle, @important_info_piece), notice: 'Important info piece was successfully created.' }
        format.json { render :show, status: :created, location: @important_info_piece }
      else
        format.html { render :new }
        format.json { render json: @important_info_piece.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /important_info_pieces/1
  # PATCH/PUT /important_info_pieces/1.json
  def update
    @circle = important_info_piece_params[:circle_id]

    respond_to do |format|
      if @important_info_piece.update(important_info_piece_params)
        format.html { redirect_to circle_important_info_piece_path(@circle, @important_info_piece), notice: 'Important info piece was successfully updated.' }
        format.json { render :show, status: :ok, location: @important_info_piece }
      else
        format.html { render :edit }
        format.json { render json: @important_info_piece.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /important_info_pieces/1
  # DELETE /important_info_pieces/1.json
  def destroy
    @important_info_piece.destroy
    respond_to do |format|
      format.html { redirect_to circle_important_info_pieces_path, notice: 'Important info piece was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_important_info_piece
      @important_info_piece = ImportantInfoPiece.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def important_info_piece_params
      params.require(:important_info_piece).permit(:description, :category_id, :circle_id, :created_by_id, :seen_by)
    end
end
