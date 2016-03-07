class PrimaryDiagnosis < ActiveRecord::Base
	self.table_name = 'diagnoses'

	has_many :primary_diagnosis_visits
  	has_many :visits, through: :primary_diagnosis_visits
end
