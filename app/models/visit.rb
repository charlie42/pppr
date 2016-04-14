class Visit < ActiveRecord::Base

  UNRANSACKABLE_ATTRIBUTES = ["id", "created_at"]

  def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  end

  belongs_to :patient
  belongs_to :doctor

  has_many :specialists, through: :consultations
  has_many :consultations

  has_one :specialist
  
  has_many :concomitant_diagnoses, through: :concomitant_diagnosis_visits
  has_many :concomitant_diagnosis_visits
  has_many :complication_diagnoses, through: :complication_diagnosis_visits
  has_many :complication_diagnosis_visits
  has_many :primary_diagnoses, through: :primary_diagnosis_visits
  has_many :primary_diagnosis_visits


  has_many :condition_values, through: :condition_visits
  has_many :condition_visits #, :dependent => :destroy

  has_many :treatment_factors, through: :treatments
  has_many :treatments, :dependent => :destroy

  has_many :examinations, through: :examination_results
  has_many :examination_results, :dependent => :destroy

  has_many :medicines, through: :medications
  has_many :medications, :dependent => :destroy

  accepts_nested_attributes_for :specialists
  accepts_nested_attributes_for :primary_diagnoses
  accepts_nested_attributes_for :concomitant_diagnoses
  accepts_nested_attributes_for :complication_diagnoses
  # accepts_nested_attributes_for :condition_visits, :allow_destroy => true
  accepts_nested_attributes_for :condition_values
  accepts_nested_attributes_for :treatments, :allow_destroy => true
  accepts_nested_attributes_for :medications, :allow_destroy => true
  accepts_nested_attributes_for :examination_results, :allow_destroy => true
  accepts_nested_attributes_for :examinations
  #accepts_nested_attributes_for :liver_condition_visits
  #validates :doctor_id, presence:true
  #validates :patient_id, presence:true

  acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :complaints, :condition_values

end
