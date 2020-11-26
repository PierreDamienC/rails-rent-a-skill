class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:email]
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :street, :ZIP, :city, :country, presence: true
  has_many :bookings, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :reviews, dependent: :destroy
  geocoded_by :address
  after_validation :geocode
  after_validation :geocode, on: [:update, :create]

  def address
    [street, city, self.ZIP, country].compact.join(', ')
  end

end
