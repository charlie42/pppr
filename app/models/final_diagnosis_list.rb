class FinalDiagnosisList < ActiveRecord::Base
  belongs_to :diagnosis
  belongs_to :patient
  belongs_to :doctor
end
