class Role < ActiveRecord::Base
  has_many :assignments
  has_many :doctors, :through => :assignments
end
