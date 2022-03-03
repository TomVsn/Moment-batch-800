class TripPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      Participant.where(user: user).map(&:trip)
    end
  end

  def show?
    # n'importe quel participant
    record.participants.exists? { |participant| participant.user == user }
  end

  def create?
    # que le propriétaire
    record.user == user
  end

  def update?
    # que le propriétaire
    record.user == user
  end

  def destroy?
    # que le propriétaire
    record.user == user
  end
end
