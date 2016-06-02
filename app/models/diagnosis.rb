class Diagnosis < ActiveRecord::Base
	# has_many :primary_diagnosis_visits
	# has_many :complication_diagnosis_visits
	# has_many :concomitant_diagnosis_visits
 #  	has_many :visits, through: :primary_diagnosis_visits
 #  	has_many :visits, through: :complication_diagnosis_visits
 #  	has_many :visits, through: :concomitant_diagnosis_visits

 def as_json(*args)
	 super.tap { |hash| hash["text"] = hash.delete "name" }
 end

 def self.get_empty_list
	 []
 end
 
end
