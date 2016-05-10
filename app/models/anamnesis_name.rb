class AnamnesisName < ActiveRecord::Base
  belongs_to :anamnesis_type
  has_many :anamnesis_values
end
