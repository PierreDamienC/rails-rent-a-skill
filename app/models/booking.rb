class Booking < ApplicationRecord
  belongs_to :skill
  belongs_to :user
  validates :date_in, :date_out, presence: true
  validate :dates_not_blank
  validate :date_in_after_date_out

  private

  def dates_not_blank
    if date_in.blank?
      errors.add(:date_in, "cannot be blank")
    elsif date_out.blank?
      errors.add(:date_out, "cannot be blank")
    end
  end


  def date_in_after_date_out
    return if date_in.blank? || date_out.blank?

    if date_out < date_in
      errors.add(:date_out, "must be after the date in")
    end
  end
end
