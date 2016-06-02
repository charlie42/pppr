class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  # GET /patients
  # GET /patients.json

  def index_for_doctor
    @doctor = current_doctor
    redirect_to "/doctors/#{@doctor.id}/patients"
  end

  def index
    #@patients = Patient.all
    @doctor = current_doctor
    patients = @doctor.patients

    @q = patients.search(params[:q]);
    @patients = @q.result(distinct: true).page(params[:page]).per(6)#.includes(:treatments, :primary_diagnosis_visits).joins(:treatmentsrj)
                        #.includes(:primary_diagnosis_visits).joins(:primary_diagnosis_visits)

    @q.build_condition
  end

  # GET /patients/1
  # GET /patients/1.json
  def show

    # @doctor = Doctor.find(params[:id])
    # unless @doctor == current_doctor
    #   redirect_to :back, :alert => "Access denied."
    # end
    # @patients = @doctor.patients

     @doctor = current_doctor
     @patient = Patient.find(params[:id])
     @visits = @patient.visits.all
  end

  def generate_pdf

      @doctor = current_doctor
      @patient = Patient.find(params[:patient_id])
      @visits = @patient.visits.all

      respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "full_medical_record",   # Excluding ".pdf" extension.
          :disposition => "inline",
          :template => "patients/generate_pdf.pdf.erb",
          :layout => "pdf_layout.html",
          :locals => {:patient => @patient, :visits => @visits, :doctor => @doctor}
      end
    end
  end


  # GET /patients/new
  def new
    @patient = Patient.new
    @doctor = Doctor.find(params[:doctor_id])
    @allergy_list = Patient.allergy_counts

  end

  # GET /patients/1/edit
  def edit
  end

  # POST /patients
  # POST /patients.json
  def create
    #@patient = Patient.new(patient_params)
     @params = patient_params
     @doctor = Doctor.find(params[:doctor_id])
     @patient = Patient.new(patient_params.except(:document_name, :allergy))
     @patient.allergy_list.add(@params["allergy"])
     @patient.document_name_list.add(@params["document_name"])

    respond_to do |format|
      if @patient.save
        format.html { redirect_to doctor_patient_path(@doctor.id, @patient.id), notice: 'Patient was successfully created.' }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: "#{t 'activerecord.successful.messages.created'}" }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:doctor_id, :name, :age, :gender, :birthday, :surname, :second_name,
        :address, :registration_address, :phone, :work_phone, :disability, :work_place, :work_position, :dependant, :area,
        :insurance_police_series, :insurance_police_number, :social_benefit_code, :document_series, :document_number,
        :martial_status, :education, :employment, :disability_time, :disability_date, :blood_type, :Rh_factor, :insurance_company,
        :document_name, :insurance_policy_series, :insurance_policy_number, :insurance_certificate, :allergy => [])
    end
end
