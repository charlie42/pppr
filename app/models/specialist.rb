class Specialist < ActiveRecord::Base
	has_many :consultations
  	has_many :visits, through: :consultations
	has_many :visits
  end
