class Examination < ActiveRecord::Base
	has_many :examination_results
	has_many :visits, through: :examination_results

	UNRANSACKABLE_ATTRIBUTES = ["id"]
	def self.ransackable_attributes auth_object = nil
	    ["name"]
	end
end
