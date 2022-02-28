class Trip < ApplicationRecord
  belongs_to :user
  has_many :accomodations, :events, :messages, :participants
  validates :start_date, :end_date, :title, presence: true
end
