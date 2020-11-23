class Skill < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :description, :price, :name, presence: true
end
