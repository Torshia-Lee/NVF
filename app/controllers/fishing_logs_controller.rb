class FishingLogsController < ApplicationController
  before_action :set_fishing_log, only: %i[ show edit update destroy ]

  # GET /fishing_logs or /fishing_logs.json
  def index
    @fishing_logs = FishingLog.all
  end

  # GET /fishing_logs/1 or /fishing_logs/1.json
  def show
  end

  # GET /fishing_logs/new
  def new
    @fishing_log = FishingLog.new
  end

  # GET /fishing_logs/1/edit
  def edit
  end

  # POST /fishing_logs or /fishing_logs.json
  def create
    @fishing_log = FishingLog.new(fishing_log_params)

    respond_to do |format|
      if @fishing_log.save
        format.html { redirect_to @fishing_log, notice: "Fishing log was successfully created." }
        format.json { render :show, status: :created, location: @fishing_log }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fishing_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fishing_logs/1 or /fishing_logs/1.json
  def update
    respond_to do |format|
      if @fishing_log.update(fishing_log_params)
        format.html { redirect_to @fishing_log, notice: "Fishing log was successfully updated." }
        format.json { render :show, status: :ok, location: @fishing_log }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fishing_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fishing_logs/1 or /fishing_logs/1.json
  def destroy
    @fishing_log.destroy!

    respond_to do |format|
      format.html { redirect_to fishing_logs_path, status: :see_other, notice: "Fishing log was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fishing_log
      @fishing_log = FishingLog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fishing_log_params
      params.require(:fishing_log).permit(:user_id, :lake_id, :date, :species, :notes, :lures, :photo)
    end
end
