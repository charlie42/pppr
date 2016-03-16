class Examination < ActiveRecord::Base
	has_many :examination_results
	has_many :visits, through: :examination_results
end
