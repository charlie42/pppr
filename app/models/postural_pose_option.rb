class PosturalPoseOption < ActiveRecord::Base
	belongs_to :visit

	UNRANSACKABLE_ATTRIBUTES = ["id"]
	def self.ransackable_attributes auth_object = nil
	    ["name"]
	end
end
