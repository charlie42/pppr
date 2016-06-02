class Medicine < ActiveRecord::Base
	has_many :medications
	has_many :visits, through: :medications
	has_many :visits

	UNRANSACKABLE_ATTRIBUTES = ["id"]
	def self.ransackable_attributes auth_object = nil
	    ["name", "code"]
	end

	def as_json(*args)
    super.tap { |hash| hash["text"] = hash.delete "name" }
	end

	def self.get_empty_list
		[]
	end
end
