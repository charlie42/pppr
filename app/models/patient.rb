class Patient < ActiveRecord::Base
  has_many :visits
  has_many :patients, through: :visits
end