class Specialist < ActiveRecord::Base
	has_many :consultations
  	has_many :visits, through: :consultations
end
