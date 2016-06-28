class Specialist < ActiveRecord::Base
	has_many :consultations
  	has_many :visits, through: :consultations
	has_many :visits

	UNRANSACKABLE_ATTRIBUTES = ["id"]
	def self.ransackable_attributes auth_object = nil
	    ["name"]
	end

	def self.get_empty_list
 	 []
  end
	
end
