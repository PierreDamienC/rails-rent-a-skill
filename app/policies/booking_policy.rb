class BookingPolicy < ApplicationPolicy

  def show?
    user == record.user || user == record.skill.user
  end

  def create?
    true
  end

  def cancel?
    user == record.skill.user
  end

  def validate?
    user == record.skill.user
  end

  def users_bookings?
    user
  end

  def my_bookings?
    user
  end

  def pay?
   user == record.user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
