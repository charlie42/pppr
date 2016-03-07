class ConstitutionOptionsController < ApplicationController
  before_action :set_constitution_option, only: [:show, :edit, :update, :destroy]

  # GET /constitution_options
  # GET /constitution_options.json
  def index
    @constitution_options = ConstitutionOption.all
  end

  # GET /constitution_options/1
  # GET /constitution_options/1.json
  def show
  end

  # GET /constitution_options/new
  def new
    @constitution_option = ConstitutionOption.new
  end

  # GET /constitution_options/1/edit
  def edit
  end

  # POST /constitution_options
  # POST /constitution_options.json
  def create
    @constitution_option = ConstitutionOption.new(constitution_option_params)

    respond_to do |format|
      if @constitution_option.save
        format.html { redirect_to @constitution_option, notice: 'Constitution option was successfully created.' }
        format.json { render :show, status: :created, location: @constitution_option }
      else
        format.html { render :new }
        format.json { render json: @constitution_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /constitution_options/1
  # PATCH/PUT /constitution_options/1.json
  def update
    respond_to do |format|
      if @constitution_option.update(constitution_option_params)
        format.html { redirect_to @constitution_option, notice: 'Constitution option was successfully updated.' }
        format.json { render :show, status: :ok, location: @constitution_option }
      else
        format.html { render :edit }
        format.json { render json: @constitution_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /constitution_options/1
  # DELETE /constitution_options/1.json
  def destroy
    @constitution_option.destroy
    respond_to do |format|
      format.html { redirect_to constitution_options_url, notice: 'Constitution option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_constitution_option
      @constitution_option = ConstitutionOption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def constitution_option_params
      params.require(:constitution_option).permit(:name)
    end
end
