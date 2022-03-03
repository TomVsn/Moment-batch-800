class ExpensePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      record.participant.trip.participants.where?(user: user)
    end
  end

  def show?
    true
  end

  def create?
    record.participant.user = user
  end

  def update?
    record.participant.trip.participants.exists?(user: user)
  end

  def destroy?
    record.participant.trip.participants.exists?(user: user)
  end
end
