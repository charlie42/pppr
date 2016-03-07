class EffleurageOptionsController < ApplicationController
  before_action :set_effleurage_option, only: [:show, :edit, :update, :destroy]

  # GET /effleurage_options
  # GET /effleurage_options.json
  def index
    @effleurage_options = EffleurageOption.all
  end

  # GET /effleurage_options/1
  # GET /effleurage_options/1.json
  def show
  end

  # GET /effleurage_options/new
  def new
    @effleurage_option = EffleurageOption.new
  end

  # GET /effleurage_options/1/edit
  def edit
  end

  # POST /effleurage_options
  # POST /effleurage_options.json
  def create
    @effleurage_option = EffleurageOption.new(effleurage_option_params)

    respond_to do |format|
      if @effleurage_option.save
        format.html { redirect_to @effleurage_option, notice: 'Effleurage option was successfully created.' }
        format.json { render :show, status: :created, location: @effleurage_option }
      else
        format.html { render :new }
        format.json { render json: @effleurage_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /effleurage_options/1
  # PATCH/PUT /effleurage_options/1.json
  def update
    respond_to do |format|
      if @effleurage_option.update(effleurage_option_params)
        format.html { redirect_to @effleurage_option, notice: 'Effleurage option was successfully updated.' }
        format.json { render :show, status: :ok, location: @effleurage_option }
      else
        format.html { render :edit }
        format.json { render json: @effleurage_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /effleurage_options/1
  # DELETE /effleurage_options/1.json
  def destroy
    @effleurage_option.destroy
    respond_to do |format|
      format.html { redirect_to effleurage_options_url, notice: 'Effleurage option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_effleurage_option
      @effleurage_option = EffleurageOption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def effleurage_option_params
      params.require(:effleurage_option).permit(:name)
    end
end
