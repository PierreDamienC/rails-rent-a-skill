class Skill < ApplicationRecord
  include PgSearch::Model

  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :description, :name, presence: true 
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  has_one_attached :photo
  has_many :reviews, dependent: :destroy
  pg_search_scope :search_by_description_and_name_price,
    against: [:name, :description],
    associated_against: {
      user: [:first_name, :last_name ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
