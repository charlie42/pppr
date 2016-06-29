class Doctor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :patients, through: :visits
  has_many :visits
  has_many :assignments
  has_many :roles, :through => :assignments

  validates :email, presence:true, length: {maximum:50}, uniqueness: {case_sensitive: false}, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "Неверный формат" }
  validates :password, length: {minimum: 6}, presence:true
  validates :company_code, presence: true, length: {maximum: 13, minimum: 13}, uniqueness: { case_sensitive: false }, format: { with: /\A[0-9]*\z/, message: "Может содержать только цифры" }

  attr_accessor :login

  def self.find_first_by_auth_conditions(warden_conditions)
	  conditions = warden_conditions.dup
	  if login = conditions.delete(:login)
	    where(conditions.to_h).where(["company_code = :value", { :value => login }]).first
	  else
	    where(conditions.to_h).first
	  end
	end

	def email_required?
  	false
	end

  # ROLES = %w[admin moderator user].freeze

  # def roles=(roles)
  #   self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  # end

  # def roles
  #   ROLES.reject do |r|
  #     ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
  #   end
  # end

  def is?(role)
    roles.any? { |r| r.name.underscore.to_sym == role }
  end

  rails_admin do
    configure :set_password

    edit do
      exclude_fields :password, :password_confirmation
      include_fields :set_password
    end
  end

  # Provided for Rails Admin to allow the password to be reset
  def set_password; nil; end

  def set_password=(value)
    return nil if value.blank?
    self.password = value
    self.password_confirmation = value
  end

end
