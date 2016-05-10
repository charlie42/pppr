class PrimaryDiagnosis < ActiveRecord::Base
	self.table_name = 'diagnoses'

	has_many :primary_diagnosis_visits
  	has_many :visits, through: :primary_diagnosis_visits

  	UNRANSACKABLE_ATTRIBUTES = ["id"]
	def self.ransackable_attributes auth_object = nil
	    ["name"]
	end
end
