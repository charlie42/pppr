class Treatment < ActiveRecord::Base
  belongs_to :treatment_factor
  belongs_to :visit
end
