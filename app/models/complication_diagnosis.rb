class ComplicationDiagnosis < ActiveRecord::Base
	self.table_name = 'diagnoses'

	has_many :complication_diagnosis_visits
  	has_many :visits, through: :complication_diagnosis_visits

  	UNRANSACKABLE_ATTRIBUTES = ["id"]
	def self.ransackable_attributes auth_object = nil
	    ["name"]
	end
end
