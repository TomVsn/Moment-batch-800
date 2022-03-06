class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :trip
  has_many :event_participants
  has_many :accomodation_votes
  has_many :expenses
  has_many :transportations
  has_many :events
  has_many :messages

  def participates?(event)
    event_participants.find_by(event: event).present?
  end

  def votes?(accomodation)
    accomodation_votes.find_by(accomodation: accomodation).present?
  end
end
