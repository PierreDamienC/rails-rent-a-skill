class Booking < ApplicationRecord
  belongs_to :skill
  belongs_to :user
  validates :date_in, :date_out, presence: true
end
