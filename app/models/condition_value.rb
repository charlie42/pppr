class ConditionValue < ActiveRecord::Base
	 belongs_to :condition_name
	 has_many :visits
	 has_many :condition_visits, through: :visits
end
