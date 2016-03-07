class SubcutaniousFatOptionsController < ApplicationController
  before_action :set_subcutanious_fat_option, only: [:show, :edit, :update, :destroy]

  # GET /subcutanious_fat_options
  # GET /subcutanious_fat_options.json
  def index
    @subcutanious_fat_options = SubcutaniousFatOption.all
  end

  # GET /subcutanious_fat_options/1
  # GET /subcutanious_fat_options/1.json
  def show
  end

  # GET /subcutanious_fat_options/new
  def new
    @subcutanious_fat_option = SubcutaniousFatOption.new
  end

  # GET /subcutanious_fat_options/1/edit
  def edit
  end

  # POST /subcutanious_fat_options
  # POST /subcutanious_fat_options.json
  def create
    @subcutanious_fat_option = SubcutaniousFatOption.new(subcutanious_fat_option_params)

    respond_to do |format|
      if @subcutanious_fat_option.save
        format.html { redirect_to @subcutanious_fat_option, notice: 'Subcutanious fat option was successfully created.' }
        format.json { render :show, status: :created, location: @subcutanious_fat_option }
      else
        format.html { render :new }
        format.json { render json: @subcutanious_fat_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subcutanious_fat_options/1
  # PATCH/PUT /subcutanious_fat_options/1.json
  def update
    respond_to do |format|
      if @subcutanious_fat_option.update(subcutanious_fat_option_params)
        format.html { redirect_to @subcutanious_fat_option, notice: 'Subcutanious fat option was successfully updated.' }
        format.json { render :show, status: :ok, location: @subcutanious_fat_option }
      else
        format.html { render :edit }
        format.json { render json: @subcutanious_fat_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subcutanious_fat_options/1
  # DELETE /subcutanious_fat_options/1.json
  def destroy
    @subcutanious_fat_option.destroy
    respond_to do |format|
      format.html { redirect_to subcutanious_fat_options_url, notice: 'Subcutanious fat option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subcutanious_fat_option
      @subcutanious_fat_option = SubcutaniousFatOption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subcutanious_fat_option_params
      params.require(:subcutanious_fat_option).permit(:name)
    end
end
