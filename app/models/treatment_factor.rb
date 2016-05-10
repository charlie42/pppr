class TreatmentFactor < ActiveRecord::Base
	has_many :treatments
	has_many :visits, through: :treatments

	UNRANSACKABLE_ATTRIBUTES = ["id"]
	def self.ransackable_attributes auth_object = nil
	    ["name"]
	end
end
