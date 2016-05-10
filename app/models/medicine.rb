class Medicine < ActiveRecord::Base
	has_many :medications
	has_many :visits, through: :medications
	has_many :visits

	UNRANSACKABLE_ATTRIBUTES = ["id"]
	def self.ransackable_attributes auth_object = nil
	    ["name", "code"]
	end
end
