class ComplicationDiagnosisVisit < ActiveRecord::Base
	belongs_to :visit
    belongs_to :complication_diagnosis
end
