class TreatmentFactor < ActiveRecord::Base
	has_many :treatments
	has_many :visits, through: :treatments
end
