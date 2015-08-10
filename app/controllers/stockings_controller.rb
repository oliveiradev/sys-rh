class StockingsController < ApplicationController
  before_action :set_stocking, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /stockings
  # GET /stockings.json
  def index
    @stockings = Stocking.all
  end

  # GET /stockings/1
  # GET /stockings/1.json
  def show
  end

  # GET /stockings/new
  def new
    @stocking = Stocking.new
  end

  # GET /stockings/1/edit
  def edit
  end

  # POST /stockings
  # POST /stockings.json
  def create
    @stocking = Stocking.new(stocking_params)

    respond_to do |format|
      if @stocking.save
        format.html { redirect_to @stocking, notice: 'Stocking was successfully created.' }
        format.json { render :show, status: :created, location: @stocking }
      else
        format.html { render :new }
        format.json { render json: @stocking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stockings/1
  # PATCH/PUT /stockings/1.json
  def update
    respond_to do |format|
      if @stocking.update(stocking_params)
        format.html { redirect_to @stocking, notice: 'Stocking was successfully updated.' }
        format.json { render :show, status: :ok, location: @stocking }
      else
        format.html { render :edit }
        format.json { render json: @stocking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stockings/1
  # DELETE /stockings/1.json
  def destroy
    @stocking.destroy
    respond_to do |format|
      format.html { redirect_to stockings_url, notice: 'Stocking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stocking
      @stocking = Stocking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stocking_params
      params.require(:stocking).permit(:data, :workload, :obs, :function_id, :local_id)
    end
end
