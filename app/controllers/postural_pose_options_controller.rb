class PosturalPoseOptionsController < ApplicationController
  before_action :set_postural_pose_option, only: [:show, :edit, :update, :destroy]

  # GET /postural_pose_options
  # GET /postural_pose_options.json
  def index
    @postural_pose_options = PosturalPoseOption.all
  end

  # GET /postural_pose_options/1
  # GET /postural_pose_options/1.json
  def show
  end

  # GET /postural_pose_options/new
  def new
    @postural_pose_option = PosturalPoseOption.new
  end

  # GET /postural_pose_options/1/edit
  def edit
  end

  # POST /postural_pose_options
  # POST /postural_pose_options.json
  def create
    @postural_pose_option = PosturalPoseOption.new(postural_pose_option_params)

    respond_to do |format|
      if @postural_pose_option.save
        format.html { redirect_to @postural_pose_option, notice: 'Postural pose option was successfully created.' }
        format.json { render :show, status: :created, location: @postural_pose_option }
      else
        format.html { render :new }
        format.json { render json: @postural_pose_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /postural_pose_options/1
  # PATCH/PUT /postural_pose_options/1.json
  def update
    respond_to do |format|
      if @postural_pose_option.update(postural_pose_option_params)
        format.html { redirect_to @postural_pose_option, notice: 'Postural pose option was successfully updated.' }
        format.json { render :show, status: :ok, location: @postural_pose_option }
      else
        format.html { render :edit }
        format.json { render json: @postural_pose_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postural_pose_options/1
  # DELETE /postural_pose_options/1.json
  def destroy
    @postural_pose_option.destroy
    respond_to do |format|
      format.html { redirect_to postural_pose_options_url, notice: 'Postural pose option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_postural_pose_option
      @postural_pose_option = PosturalPoseOption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def postural_pose_option_params
      params.require(:postural_pose_option).permit(:name)
    end
end
