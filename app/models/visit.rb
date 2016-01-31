class Visit < ActiveRecord::Base
  belongs_to :patient
  belongs_to :doctor

  has_many :liver_conditions, through: :liver_condition_visits
  has_many :liver_condition_visits

  has_many :abdominal_conditions, through: :abdominal_condition_visits
  has_many :abdominal_condition_visits

  has_many :specialists, through: :consultations
  has_many :consultations

  accepts_nested_attributes_for :liver_conditions
  accepts_nested_attributes_for :abdominal_conditions
  accepts_nested_attributes_for :specialists
  #accepts_nested_attributes_for :liver_condition_visits
  #validates :doctor_id, presence:true
  #validates :patient_id, presence:true

end
