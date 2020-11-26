class Skill < ApplicationRecord
  include PgSearch::Model

  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :description, :price, :name, presence: true
  has_one_attached :photo
  has_many :reviews, dependent: :destroy

  pg_search_scope :search_by_name_and_description_and_price
end
