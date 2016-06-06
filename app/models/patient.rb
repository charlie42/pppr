class Patient < ActiveRecord::Base
  has_many :visits
  has_many :doctors, through: :visits
  has_many :final_diagnosis_lists
  has_many :dispanserisations

  UNRANSACKABLE_ATTRIBUTES = ["id"]

  def self.ransackable_attributes auth_object = nil
    #(column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
    ["name", "gender", "birthday", "phone", "insurance_certificate",
     "insurance_policy_series", "insurance_policy_number", "document_name",
      "document_series", "document_number", "created_at", "bool_test"]
  end

  extend Enumerize

  enumerize :gender, in: [:male, :female, :unknown], default: :female, i18n_scope: "gender_scope"
  enumerize :area, in: [:urban, :rural], default: :urban, i18n_scope: "area_scope"
  enumerize :martial_status, in: [:married, :single, :unknown], default: :single, i18n_scope: "martial_status_scope"
  enumerize :education, in: [:higher, :secondary,
    :general_secondary, :general_basic, :general_primary, :unknown], default: :unknown, i18n_scope: "education_scope"
  enumerize :employment, in: [:job, :military,
    :retirement, :student, :unemployed, :other], default: :job, i18n_scope: "employment_scope"
  enumerize :disability_time, in: [:primary, :secondary], i18n_scope: "disability_scope"
  enumerize :Rh_factor, in: [:positive, :negative], default: :positive, i18n_scope: "Rh_factor_scope"

  acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :allergy, :document_name


  #validates :gender, length: {maximum: 1}
  validates :name, presence:true
  validates :phone, length:{ minimum: 10, maximum: 12 }, numericality: { only_integer: true }, :on => :create
  validates :insurance_policy_series, length: {minimum: 4, maximum: 6}, numericality: { only_integer: true }, :on => :create
  validates :insurance_policy_number, length: {minimum: 2, maximum: 10}, numericality: { only_integer: true }, :on => :create
  validates :disability, presence:false, numericality: { only_integer: true,  :allow_blank => true}, inclusion: {in: 1..3, :allow_blank => true}, :on => :create
  validates :social_benefit_code, presence:false, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 507,  :allow_blank => true }, :on => :create
  validates :document_series, length: {minimum: 0, maximum: 4}, :on => :create
  validates :document_number, length: {minimum: 4, maximum: 16}, :on => :create
  #validates :gender, presence:true
  #validates :age, presence:true
end
