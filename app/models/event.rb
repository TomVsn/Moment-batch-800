class Event < ApplicationRecord
  belongs_to :participant
  belongs_to :trip
  has_many :event_participants
end
