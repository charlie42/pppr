class VisitsController < ApplicationController
  before_action :set_visit, only: [:show, :edit, :update, :destroy]

  # GET /visits
  # GET /visits.json
  def index
    @doctor = Doctor.find(params[:doctor_id])
    @patient = Patient.find(params[:patient_id])
    @visits = Visit.all

  end

  # GET /visits/1
  # GET /visits/1.json
  def show
    @doctor = Doctor.find(params[:doctor_id])
    @patient = Patient.find(params[:patient_id])
    @visit = Visit.find(params[:id])
  end

  # GET /visits/new
  def new
    @doctor = Doctor.find(params[:doctor_id])
    @patient = Patient.find(params[:patient_id])
    @visit = Visit.new
    #if @visit.save 
      #params[:liver_conditions_attributes].each do |key, value|
        #@visit.liver_conditions << LiverConditionVisit.new(:visit_id => params[:id], :liver_condition_id => value, :details => params[:details])
     # @visit.liver_condition_visits << LiverConditionVisit.new(:visit_id => params[:id], :liver_condition_id => params[:liver_condition_id], :details => params[:details])
      #end
    #end
    #@visit.doctor_id = @doctor.id
    #@visit.patient_id = params[:patient_id]

    puts params.inspect
  end

  # GET /visits/1/edit
  def edit
  end

  # POST /visits
  # POST /visits.json
  def create
    @doctor = Doctor.find(params[:doctor_id])
    @patient = Patient.find(params[:patient_id])
    @visit = Visit.new(visit_params)

    h = params['visit']["liver_condition_visits"]["liver_condition_ids"]
    h.each do |v|
        @det = params['visit']["liver_condition_visits"]["details"]
        @lc = @visit.liver_condition_visits.build(:visit_id => params[:id], :liver_condition_id => v, :details => @det)
        @lc.save
    end

    h = params['visit']["abdominal_condition_visits"]["abdominal_condition_ids"]
    h.each do |v|
        @det = params['visit']["abdominal_condition_visits"]["details"]
        @lc = @visit.abdominal_condition_visits.build(:visit_id => params[:id], :abdominal_condition_id => v, :details => @det)
        @lc.save
    end

    respond_to do |format|
      if @visit.save
        format.html { redirect_to doctor_patient_visit_path(@doctor.id, @patient.id, @visit.id), notice: 'Visit was successfully created.' }
        format.json { render :show, status: :created, location: @visit }
      else
        format.html { render :new }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visits/1
  # PATCH/PUT /visits/1.json
  def update
    respond_to do |format|
      if @visit.update(visit_params)
        format.html { redirect_to @visit, notice: 'Visit was successfully updated.' }
        format.json { render :show, status: :ok, location: @visit }
      else
        format.html { render :edit }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visits/1
  # DELETE /visits/1.json
  def destroy
    @visit.destroy
    respond_to do |format|
      format.html { redirect_to visits_url, notice: 'Visit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visit
      @visit = Visit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def visit_params
      #{:post => params.require(:post).permit(:title, :body, images_posts_attributes: [:caption, image_attributes: [:image]] )}
      params.require(:visit).permit(:from, 
        :date, :complaints, :anamnesis, :allerg, :general_state_option_id, 
        :diagnosis, :doctor_id, :patient_id, :constitution_option_id, 
        :effleurage_option_id, :postural_pose_option_id, 
        :subcutanious_fat_option_id, 
        liver_condition_visits_attributes: 
          [:details, 
          :liver_condition_id],
        abdominal_condition_visits_attributes: 
          [:details, 
          :abdominal_condition_id]  
        )
      #params.require(:visit).permit(:from, :date, :complaints, :anamnesis, :allerg, :general_state_option_id, :diagnosis, :doctor_id, :patient_id, :constitution_option_id, :effleurage_option_id, :postural_pose_option_id, :subcutanious_fat_option_id)
      #params.require(:liver_condition).permit(:details, :liver_condition_id)
    end
end
