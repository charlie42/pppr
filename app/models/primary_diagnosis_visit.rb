class PrimaryDiagnosisVisit < ActiveRecord::Base
	belongs_to :visit
    belongs_to :primary_diagnosis
end
