class LiverConditionsController < ApplicationController
  before_action :set_liver_condition, only: [:show, :edit, :update, :destroy]

  # GET /liver_conditions
  # GET /liver_conditions.json
  def index
    @liver_conditions = LiverCondition.all
  end

  # GET /liver_conditions/1
  # GET /liver_conditions/1.json
  def show
  end

  # GET /liver_conditions/new
  def new
    @liver_condition = LiverCondition.new
  end

  # GET /liver_conditions/1/edit
  def edit
  end

  # POST /liver_conditions
  # POST /liver_conditions.json
  def create
    @liver_condition = LiverCondition.new(liver_condition_params)

    respond_to do |format|
      if @liver_condition.save
        format.html { redirect_to @liver_condition, notice: 'Liver condition was successfully created.' }
        format.json { render :show, status: :created, location: @liver_condition }
      else
        format.html { render :new }
        format.json { render json: @liver_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /liver_conditions/1
  # PATCH/PUT /liver_conditions/1.json
  def update
    respond_to do |format|
      if @liver_condition.update(liver_condition_params)
        format.html { redirect_to @liver_condition, notice: 'Liver condition was successfully updated.' }
        format.json { render :show, status: :ok, location: @liver_condition }
      else
        format.html { render :edit }
        format.json { render json: @liver_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /liver_conditions/1
  # DELETE /liver_conditions/1.json
  def destroy
    @liver_condition.destroy
    respond_to do |format|
      format.html { redirect_to liver_conditions_url, notice: 'Liver condition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_liver_condition
      @liver_condition = LiverCondition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def liver_condition_params
      params.require(:liver_condition).permit(:name)
    end
end
