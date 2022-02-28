class Trip < ApplicationRecord
  belongs_to :user
  has_many :accomodations, :events, :messages, :participants
end
