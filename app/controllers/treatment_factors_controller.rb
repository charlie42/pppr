class TreatmentFactorsController < ApplicationController
  before_action :set_treatment_factor, only: [:show, :edit, :update, :destroy]

  # GET /treatment_factors
  # GET /treatment_factors.json
  def index
    @treatment_factors = TreatmentFactor.all
  end

  # GET /treatment_factors/1
  # GET /treatment_factors/1.json
  def show
  end

  # GET /treatment_factors/new
  def new
    @treatment_factor = TreatmentFactor.new
  end

  # GET /treatment_factors/1/edit
  def edit
  end

  # POST /treatment_factors
  # POST /treatment_factors.json
  def create
    @treatment_factor = TreatmentFactor.new(treatment_factor_params)

    respond_to do |format|
      if @treatment_factor.save
        format.html { redirect_to @treatment_factor, notice: 'Treatment factor was successfully created.' }
        format.json { render :show, status: :created, location: @treatment_factor }
      else
        format.html { render :new }
        format.json { render json: @treatment_factor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /treatment_factors/1
  # PATCH/PUT /treatment_factors/1.json
  def update
    respond_to do |format|
      if @treatment_factor.update(treatment_factor_params)
        format.html { redirect_to @treatment_factor, notice: 'Treatment factor was successfully updated.' }
        format.json { render :show, status: :ok, location: @treatment_factor }
      else
        format.html { render :edit }
        format.json { render json: @treatment_factor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /treatment_factors/1
  # DELETE /treatment_factors/1.json
  def destroy
    @treatment_factor.destroy
    respond_to do |format|
      format.html { redirect_to treatment_factors_url, notice: 'Treatment factor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_treatment_factor
      @treatment_factor = TreatmentFactor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def treatment_factor_params
      params.require(:treatment_factor).permit(:name)
    end
end
