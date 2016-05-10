class ExaminationResult < ActiveRecord::Base
  belongs_to :examination
  belongs_to :visit

  UNRANSACKABLE_ATTRIBUTES = ["id"]
	def self.ransackable_attributes auth_object = nil
	    ["result", "details"]
	end
end
