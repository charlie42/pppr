class Medicine < ActiveRecord::Base
	has_many :medications
	has_many :visits, through: :medications
end