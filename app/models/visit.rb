class Visit < ActiveRecord::Base
  belongs_to :patient
  belongs_to :doctor

  has_many :specialists, through: :consultations
  has_many :consultations
  
  has_many :concomitant_diagnoses, through: :concomitant_diagnosis_visits
  has_many :concomitant_diagnosis_visits
  has_many :complication_diagnoses, through: :complication_diagnosis_visits
  has_many :complication_diagnosis_visits
  has_many :primary_diagnoses, through: :primary_diagnosis_visits
  has_many :primary_diagnosis_visits


  has_many :condition_values, through: :condition_visits
  has_many :condition_visits


  accepts_nested_attributes_for :specialists
  accepts_nested_attributes_for :primary_diagnosis_visits
  accepts_nested_attributes_for :concomitant_diagnosis_visits
  accepts_nested_attributes_for :complication_diagnosis_visits
  accepts_nested_attributes_for :condition_values
  #accepts_nested_attributes_for :liver_condition_visits
  #validates :doctor_id, presence:true
  #validates :patient_id, presence:true

end
