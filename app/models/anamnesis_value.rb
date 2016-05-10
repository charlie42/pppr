class AnamnesisValue < ActiveRecord::Base
  belongs_to :anamnesis_name
  has_many :anamnesis_visits
  has_many :visits, through: :anamnesis_visits
end
