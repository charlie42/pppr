class ConcomitantDiagnosisVisit < ActiveRecord::Base
	belongs_to :visit
    belongs_to :concomitant_diagnosis
end
