class ExaminationResult < ActiveRecord::Base
  belongs_to :examination
  belongs_to :visit
end
