class ConditionName < ActiveRecord::Base
	belongs_to :condition_type
	has_many :condition_values
end
