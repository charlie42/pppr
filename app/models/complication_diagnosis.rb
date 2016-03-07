class ComplicationDiagnosis < ActiveRecord::Base
	self.table_name = 'diagnoses'

	has_many :complication_diagnosis_visits
  	has_many :visits, through: :complication_diagnosis_visits
end
