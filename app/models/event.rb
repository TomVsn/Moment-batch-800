class Event < ApplicationRecord
  belongs_to :participant
  belongs_to :trip
  has_many :event_participants
  validates :description, presence: true
end
