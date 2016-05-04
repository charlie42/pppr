class Patient < ActiveRecord::Base
  has_many :visits
  has_many :doctors, through: :visits

  UNRANSACKABLE_ATTRIBUTES = ["id"]

  def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  end

  #validates :gender, length: {maximum: 1}
  #validates :name, presence:true
  #validates :gender, presence:true
  #validates :age, presence:true
end
