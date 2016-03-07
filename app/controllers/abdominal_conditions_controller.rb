class AbdominalConditionsController < ApplicationController
  before_action :set_abdominal_condition, only: [:show, :edit, :update, :destroy]

  # GET /abdominal_conditions
  # GET /abdominal_conditions.json
  def index
    @abdominal_conditions = AbdominalCondition.all
  end

  # GET /abdominal_conditions/1
  # GET /abdominal_conditions/1.json
  def show
  end

  # GET /abdominal_conditions/new
  def new
    @abdominal_condition = AbdominalCondition.new
  end

  # GET /abdominal_conditions/1/edit
  def edit
  end

  # POST /abdominal_conditions
  # POST /abdominal_conditions.json
  def create
    @abdominal_condition = AbdominalCondition.new(abdominal_condition_params)

    respond_to do |format|
      if @abdominal_condition.save
        format.html { redirect_to @abdominal_condition, notice: 'Abdominal condition was successfully created.' }
        format.json { render :show, status: :created, location: @abdominal_condition }
      else
        format.html { render :new }
        format.json { render json: @abdominal_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /abdominal_conditions/1
  # PATCH/PUT /abdominal_conditions/1.json
  def update
    respond_to do |format|
      if @abdominal_condition.update(abdominal_condition_params)
        format.html { redirect_to @abdominal_condition, notice: 'Abdominal condition was successfully updated.' }
        format.json { render :show, status: :ok, location: @abdominal_condition }
      else
        format.html { render :edit }
        format.json { render json: @abdominal_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /abdominal_conditions/1
  # DELETE /abdominal_conditions/1.json
  def destroy
    @abdominal_condition.destroy
    respond_to do |format|
      format.html { redirect_to abdominal_conditions_url, notice: 'Abdominal condition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_abdominal_condition
      @abdominal_condition = AbdominalCondition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def abdominal_condition_params
      params.require(:abdominal_condition).permit(:name)
    end
end
