class Patient < ActiveRecord::Base
  has_many :visits
  has_many :doctors, through: :visits

  #validates :gender, length: {maximum: 1}
  #validates :name, presence:true
  #validates :gender, presence:true
  #validates :age, presence:true
end
