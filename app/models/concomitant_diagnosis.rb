class ConcomitantDiagnosis < ActiveRecord::Base
	self.table_name = 'diagnoses'

	has_many :concomitant_diagnosis_visits
  	has_many :visits, through: :concomitant_diagnosis_visits
end
