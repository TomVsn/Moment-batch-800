class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :trip
  has_many :accomodation_votes, :event_participants, :expenses, :transportations, :events, :messages
end
