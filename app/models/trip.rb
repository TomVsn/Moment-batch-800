class Trip < ApplicationRecord
  belongs_to :user
  has_many :accomodations
  has_many :events
  has_many :messages
  has_many :participants
  validates :start_date, :end_date, :title, presence: true
end
