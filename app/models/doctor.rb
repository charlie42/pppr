class Doctor < ActiveRecord::Base
  has_many :patients, through: :visits
  has_many :visits
end
