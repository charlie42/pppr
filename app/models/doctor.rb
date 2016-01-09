class Doctor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :patients, through: :visits
  has_many :visits

  validates :email, presence:true, length: {maximum:50}, uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 6}, presence:true
end
