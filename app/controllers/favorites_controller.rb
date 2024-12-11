class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_favorite, only: %i[ show edit update destroy ]

  # GET /favorites or /favorites.json
  def index
    @favorites = current_user.favorites.paginate(page: params[:page], per_page: 9)
  end

  # GET /favorites/1 or /favorites/1.json
  def show
    @favorite = Favorite.find(params[:id])
  end

  # GET /favorites/new
  def new
    @favorite = Favorite.new
    @lakes = Lake.all
  end

  # GET /favorites/1/edit
  def edit
  end

  # POST /favorites or /favorites.json
  def create
    @favorite = current_user.favorites.new(favorite_params)
    @lakes = Lake.all

    respond_to do |format|
      if @favorite.save
        format.html { redirect_to @favorite, notice: "Favorite was successfully created." }
        format.json { render :show, status: :created, location: @favorite }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favorites/1 or /favorites/1.json
  def update
    respond_to do |format|
      if @favorite.update(favorite_params)
        format.html { redirect_to @favorite, notice: "Favorite was successfully updated." }
        format.json { render :show, status: :ok, location: @favorite }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorites/1 or /favorites/1.json
  def destroy
    @favorite.destroy!

    respond_to do |format|
      format.html { redirect_to favorites_path, status: :see_other, notice: "Favorite was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def favorite_params
      params.require(:favorite).permit(:user_id, :lake_id, :notes)
    end
end
