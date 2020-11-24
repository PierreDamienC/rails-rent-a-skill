class BookingPolicy < ApplicationPolicy

  def show?
    user == record.user || user == record.skill.user
  end

  def create?
    true
  end

  def validate?
    user == record.skill.user
  end

  class Scope < Scope


    def resolve
      scope.all
    end
  end
end
