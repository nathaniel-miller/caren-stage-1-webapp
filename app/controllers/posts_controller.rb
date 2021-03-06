class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @in_circle = !!params[:circle_id] #for menu
    @circle = params[:circle_id]
    @posts = Post.where("circle_id = ?", params[:circle_id])
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @in_circle = !!params[:circle_id] #for menu
    @circle = params[:circle_id]
  end

  # GET /posts/new
  def new
    @in_circle = !!params[:circle_id] #for menu
    @circle = params[:circle_id]
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @in_circle = !!params[:circle_id] #for menu
    @circle = params[:circle_id]
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @circle = post_params[:circle_id]

    respond_to do |format|
      if @post.save
        format.html { redirect_to circle_post_path(@circle, @post), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @circle = post_params[:circle_id]

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to circle_post_path(@circle, @post), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to circle_posts_path, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:description, :circle_id, :user_id, :medical)
    end
end
