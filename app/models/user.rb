class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:email]
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_many :bookings, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
