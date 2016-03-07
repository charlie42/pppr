class GeneralStateOptionsController < ApplicationController
  before_action :set_general_state_option, only: [:show, :edit, :update, :destroy]

  # GET /general_state_options
  # GET /general_state_options.json
  def index
    @general_state_options = GeneralStateOption.all
  end

  # GET /general_state_options/1
  # GET /general_state_options/1.json
  def show
  end

  # GET /general_state_options/new
  def new
    @general_state_option = GeneralStateOption.new
  end

  # GET /general_state_options/1/edit
  def edit
  end

  # POST /general_state_options
  # POST /general_state_options.json
  def create
    @general_state_option = GeneralStateOption.new(general_state_option_params)

    respond_to do |format|
      if @general_state_option.save
        format.html { redirect_to @general_state_option, notice: 'General state option was successfully created.' }
        format.json { render :show, status: :created, location: @general_state_option }
      else
        format.html { render :new }
        format.json { render json: @general_state_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /general_state_options/1
  # PATCH/PUT /general_state_options/1.json
  def update
    respond_to do |format|
      if @general_state_option.update(general_state_option_params)
        format.html { redirect_to @general_state_option, notice: 'General state option was successfully updated.' }
        format.json { render :show, status: :ok, location: @general_state_option }
      else
        format.html { render :edit }
        format.json { render json: @general_state_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /general_state_options/1
  # DELETE /general_state_options/1.json
  def destroy
    @general_state_option.destroy
    respond_to do |format|
      format.html { redirect_to general_state_options_url, notice: 'General state option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_general_state_option
      @general_state_option = GeneralStateOption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def general_state_option_params
      params.require(:general_state_option).permit(:name)
    end
end
