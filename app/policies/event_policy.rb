class EventPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user: user)
    end
  end

  # def index?
  #   record.user == user
  # end

  def show?
    # record.user == user
    true
  end

  def create?
    record.trip.participants.exists? { |participant| participant.user == user }
  end

  def update?
    record.event_participants.exists? { |event_participant| event_participant.participant.user == user }
  end

  def destroy?
    record.event_participants.exists? { |event_participant| event_participant.participant.user == user }
  end
end
