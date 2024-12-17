class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :set_comment, only: %i[ show edit update destroy ]

  # GET /comments or /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
    @lake = Lake.find(params[:lake_id])
    @comment = @lake.comments.create(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to lake_path(@lake), notice: "Comment was successfully created."
    else
      redirect_to lake_path(@lake), notice: "Comment was not created."
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @lake = Lake.find(params[:lake_id])
    @comment = current_user.comments.find_by(id: params[:id])


    if @comment
      @comment.destroy!
      respond_to do |format|
        format.html { redirect_to lake_path(@lake), status: :see_other, notice: "Comment was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to lake_path(@lake), notice: "You are not authorized to delete this comment." }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:body)
    end
end
