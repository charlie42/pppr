class ConcomitantDiagnosis < ActiveRecord::Base
	self.table_name = 'diagnoses'

	has_many :concomitant_diagnosis_visits
  	has_many :visits, through: :concomitant_diagnosis_visits

  	UNRANSACKABLE_ATTRIBUTES = ["id"]
	def self.ransackable_attributes auth_object = nil
	    ["name"]
	end
end
