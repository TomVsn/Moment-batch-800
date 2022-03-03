class Event < ApplicationRecord
  belongs_to :participant
  belongs_to :trip
  has_many :event_participants, dependent: :destroy
  validates :description, presence: true
end
