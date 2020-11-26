class Skill < ApplicationRecord
  include PgSearch::Model

  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :description, :price, :name, presence: true
  has_one_attached :photo
  has_many :reviews, dependent: :destroy
end
