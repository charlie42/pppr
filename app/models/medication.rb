class Medication < ActiveRecord::Base
  belongs_to :medicine
  belongs_to :visit
end
