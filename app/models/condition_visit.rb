class ConditionVisit < ActiveRecord::Base
	belongs_to :visit
    belongs_to :condition_value
end
