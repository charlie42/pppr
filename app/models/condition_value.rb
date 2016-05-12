class ConditionValue < ActiveRecord::Base
	 belongs_to :condition_name
	 has_many :condition_visits
	 has_many :visits, through: :condition_visits

	 UNRANSACKABLE_ATTRIBUTES = ["id"]
	def self.ransackable_attributes auth_object = nil
	    ["name"]
	end
end
