class Visit < ActiveRecord::Base

  UNRANSACKABLE_ATTRIBUTES = ["id", "updated_at", "anamnesis", "allerg", "patient_id",
   "doctor_id", "constitution_option_id", "general_state_option_id", "postural_pose_option_id",
   "subcutanious_fat_option_id", "from_id", "effleurage_option_id", "height", "weight", "temp", "next",
   "general_state", "diagnosis", "created_at", "next", "complaints"]

  def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + (_ransackers.keys)
  end

  # ransacker :bool_test do
  #   Arel.sql("to_char(\"#{table_name}\".\"bool_test\", '99999')")
  # end

  ransacker :next do
    Arel.sql("TO_CHAR(next, 'DD.MM.YYYY')")
  end

  ransacker :id do
    Arel.sql("to_char(id, '9999999')") 
  end


  ransacker :created_at do
    Arel::Nodes::SqlLiteral.new("date(visits.created_at)")
  end

  ransacker :next do
    Arel::Nodes::SqlLiteral.new("date(visits.next)")
  end


  # ransacker :from do
  #   specialists  = Arel::Table.new(:specialists, ActiveRecord::Base)
  #   Visit.joins(:specialist).where(specialists[:id].eq(from_id))
  # end

  belongs_to :patient
  belongs_to :doctor

  has_many :specialists, through: :consultations
  has_many :consultations

  belongs_to :from, :class_name => 'Specialist'
  belongs_to :constitution_option
  belongs_to :general_state_option
  belongs_to :postural_pose_option
  
  has_many :concomitant_diagnoses, through: :concomitant_diagnosis_visits
  has_many :concomitant_diagnosis_visits
  has_many :complication_diagnoses, through: :complication_diagnosis_visits
  has_many :complication_diagnosis_visits
  has_many :primary_diagnoses, through: :primary_diagnosis_visits
  has_many :primary_diagnosis_visits


  has_many :condition_values, through: :condition_visits
  has_many :condition_visits #, :dependent => :destroy

  has_many :anamnesis_values, through: :anamnesis_visits
  has_many :anamnesis_visits

  has_many :treatment_factors, through: :treatments
  has_many :treatments, :dependent => :destroy

  has_many :examinations, through: :examination_results
  has_many :examination_results, :dependent => :destroy

  has_many :medicines, through: :medications
  has_many :medications, :dependent => :destroy

  accepts_nested_attributes_for :specialists
  accepts_nested_attributes_for :primary_diagnoses
  accepts_nested_attributes_for :concomitant_diagnoses
  accepts_nested_attributes_for :complication_diagnoses
  # accepts_nested_attributes_for :condition_visits, :allow_destroy => true
  accepts_nested_attributes_for :condition_values
  accepts_nested_attributes_for :anamnesis_values
  accepts_nested_attributes_for :treatments, :allow_destroy => true
  accepts_nested_attributes_for :medications, :allow_destroy => true
  accepts_nested_attributes_for :examination_results, :allow_destroy => true
  accepts_nested_attributes_for :examinations
  #accepts_nested_attributes_for :liver_condition_visits
  #validates :doctor_id, presence:true
  #validates :patient_id, presence:true

  acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :complaints

end
