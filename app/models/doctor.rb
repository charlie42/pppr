class Doctor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :patients, through: :visits
  has_many :visits

  #validates :email, presence:true, length: {maximum:50}, uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 6}, presence:true
  validates :company_code, presence: true, length: {maximum: 13, minimum: 13}, uniqueness: { case_sensitive: false }, format: { with: /\A[0-9]*\z/, message: "Может содержать только цифры" }

  attr_accessor :login

  def self.find_first_by_auth_conditions(warden_conditions)
	  conditions = warden_conditions.dup
	  if login = conditions.delete(:login)
	    where(conditions).where(["company_code = :value", { :value => login }]).first
	  else
	    where(conditions).first
	  end
	end

	def email_required?
    	false
  	end
end
