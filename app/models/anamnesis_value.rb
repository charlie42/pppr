class AnamnesisValue < ActiveRecord::Base
  belongs_to :anamnesis_name
  has_many :anamnesis_visits
  has_many :visits, through: :anamnesis_visits

   UNRANSACKABLE_ATTRIBUTES = ["id"]
	def self.ransackable_attributes auth_object = nil
	    ["name"]
	end
	
end
