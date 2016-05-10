class Patient < ActiveRecord::Base
  has_many :visits
  has_many :doctors, through: :visits

  UNRANSACKABLE_ATTRIBUTES = ["id"]

  def self.ransackable_attributes auth_object = nil
    #(column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
    ["name", "gender", "birthday", "phone", "insurance_certificate",
     "insurance_policy_series", "insurance_policy_number", "document_name",
      "document_series", "document_number", "created_at", "bool_test"]
  end

  extend Enumerize

  enumerize :gender, in: [:male, :female, :unknown]
  enumerize :area, in: [:urban, :rural]
  enumerize :martial_status, in: [:married, :single, :unknown]
  enumerize :education, in: [:higher, :secondary, 
    :general_secondary, :general_basic, :general_primary, :unknown]
  enumerize :employment, in: [:job, :military, 
    :retirement, :student, :unemployed, :other]
  enumerize :disability_time, in: [:primary, :secondary]
  enumerize :Rh_factor, in: [:positive, :negative]

  acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :allergy, :document_name


  #validates :gender, length: {maximum: 1}
  #validates :name, presence:true
  #validates :gender, presence:true
  #validates :age, presence:true
end
