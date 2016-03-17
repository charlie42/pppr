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

    @visit.treatments.build
    @visit.medications.build
    @visit.examination_results.build

    #@visit.primary_diagnosis_visits.build
    #@visit.concomitant_diagnosis_visits.build
    #@visit.complication_diagnosis_visits.build


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

  # def populate_join_table h, det, name
  #   h.each do |v|
  #       @lc = @visit.send(name + "_visits").build(:visit_id => params[:id], (name + "_id").to_sym => v, :details => det)
  #       @lc.save
  #   end
  # end

  # def populate_join_table_custom_name_det h, det, join_table_name, id_name
  #   i = 0
  #   h.each do |v|
  #       @lc = @visit.send(join_table_name).build(:visit_id => params[:id], (id_name).to_sym => v, :details => det)
  #       @lc.save
  #       i += 1
  #   end
  # end

  # def populate_join_table_custom_name_res h, res, join_table_name, id_name
  #   i = 0
  #   h.each do |v|
  #       @lc = @visit.send(join_table_name).build(:visit_id => params[:id], (id_name).to_sym => v, :result => res)
  #       @lc.save
  #       i += 1
  #   end
  # end

  # POST /visits
  # POST /visits.json
  def create
    @doctor = Doctor.find(params[:doctor_id])
    @patient = Patient.find(params[:patient_id])
    @visit = Visit.new(visit_params)


    # if params['visit']['treatments']
    #   @visit.treatments.build(:treatment_factor_id => params['visit']['treatments']['treatment_factor_id'])
    # end

    #r = params['visit']["diagnosis_visits"]
    #if r["diagnosis_ids"]
    #  populate_join_table r["diagnosis_ids"], r["diagnosis_types"], "diagnosis"
    #end

    #r = params['visit']["diagnosis_visits"]
    #ids = r["diagnosis_ids"]
    #types = r["diagnosis_type_ids"]
    #i = 0
    #if r
      #r.each do |v|
         # @lc = @visit.diagnosis_visits.build(:visit_id => params[:id], :diagnosis_id => v["diagnosis_id"].to_i, :diagnosis_type_id => v["diagnosis_type_id"].to_i)
         # @lc.save
          #i += 1
    #  end
    #end

    @result = params['visit']["consultations"]["result"]
    @ids = params['visit']["consultations"]["specialist_ids"]
    if @ids
      i = 0
      @ids.each do |v|
          @lc = @visit.consultations.build(:visit_id => params[:id], :specialist_id => v, :result => @result)
          @lc.save
          i += 1
      end
    end

    # @details = params['visit']["treatments"]["details"]
    # @amount = params['visit']["treatments"]["amount"]
    # @ids = params['visit']["treatments"]["treatment_factor_ids"]
    # if @ids
    #   i = 0
    #   @ids.each do |v|
    #       @lc = @visit.treatments.build(:visit_id => params[:id], :treatment_factor_id => v, :amount => @amount, :details => @details)
    #       @lc.save
    #       i += 1
    #   end
    # end


    # @lc = @visit.treatments.build(:visit_id => params[:id], :factor_id => params['visit']['treatment']['treatment_factor_id'], 
    #       :amount => params['visit']['treatment']['amount'], :details => params['visit']['treatment']['details'])
    # @lc.save


    # @details = params['visit']["examination_results"]["details"]
    # @result = params['visit']["examination_results"]["result"]
    @ids = params['visit']["examination_result"]["examination_ids"]
    if @ids
      i = 0
      @ids.each do |v|
          @lc = @visit.examination_results.build(:visit_id => params[:id], :examination_id => v#, :result => @result, :details => @details
              )
          @lc.save
          i += 1
      end
    end


    @details = params['visit']["concomitant_diagnosis_visits"]["details"]
    @ids = params['visit']["concomitant_diagnosis_visits"]["concomitant_diagnosis_ids"]
    if @ids
      i = 0
      @ids.each do |v|
          @lc = @visit.concomitant_diagnosis_visits.build(:visit_id => params[:id], :concomitant_diagnosis_id => v, :details => @details)
          @lc.save
          i += 1
      end
    end

    @details = params['visit']["complication_diagnosis_visits"]["details"]
    @ids = params['visit']["complication_diagnosis_visits"]["complication_diagnosis_ids"]
    if @ids
      i = 0
      @ids.each do |v|
          @lc = @visit.complication_diagnosis_visits.build(:visit_id => params[:id], :complication_diagnosis_id => v, :details => @details)
          @lc.save
          i += 1
      end
    end

    @details = params['visit']["primary_diagnosis_visits"]["details"]
    @ids = params['visit']["primary_diagnosis_visits"]["primary_diagnosis_ids"]
    #if @r
      if @ids
        i = 0
        @ids.each do |v|
            @lc = @visit.primary_diagnosis_visits.build(:visit_id => params[:id], :primary_diagnosis_id => v, :details => @details)
            @lc.save
            i += 1
        end
      end
   # end


    @details = params['visit']["condition_visits"]["details"]
    @ids = params['visit']["condition_visits"]["condition_value_ids"]
    i = 0
    if @ids
      @ids.each do |v|
          @lc = @visit.condition_visits.build(:visit_id => params[:id], :condition_value_id => v, :details => @details)
          @lc.save
          i += 1
      end
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
        treatments_attributes:
          [:id, :treatment_factor_id, :amount, :details, :_destroy],
        medications_attributes: 
          [:id, :medicine_id, :dosage, :duration, :details, :_destroy],
        examination_results_attributes:
          [:id, :examinations, :examination_id, :result, :details, :_destroy],
        consultations_attributes: 
          [:result, :specialists],
        primary_diagnosis_visits_attributes:
          [:primary_diagnoses],
        concomitant_diagnosis_visits_attributes:
          [:concomitant_diagnoses],
        complication_diagnosis_visits_attributes:
          [:complication_diagnoses],
        condition_visits_attributes:
          [:values],
        condition_names_attributes:
          [:names, :detailss]
        )
      #params.require(:visit).permit(:from, :date, :complaints, :anamnesis, :allerg, :general_state_option_id, :diagnosis, :doctor_id, :patient_id, :constitution_option_id, :effleurage_option_id, :postural_pose_option_id, :subcutanious_fat_option_id)
      #params.require(:liver_condition).permit(:details, :liver_condition_id)
    end
end
