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
    record.participant.user == user
  end

  def update?
    # record.user == user
    record.participant.user == user
  end

  def destroy?
    record.user == user
  end
end
