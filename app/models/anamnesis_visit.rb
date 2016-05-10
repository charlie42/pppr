class AnamnesisVisit < ActiveRecord::Base
  belongs_to :visit
  belongs_to :anamnesis_value
end
