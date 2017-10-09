class User < ActiveRecord::Base
	validates :username, :email, :mobile, :gender, :dob, presence: true
	validates :mobile, numericality: true
	validates :username, :email, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
