class Visit < ActiveRecord::Base
  belongs_to :patient
  belongs_to :doctor

  validates :doctor_id, presence:true
  validates :patient_id, presence:true
end
