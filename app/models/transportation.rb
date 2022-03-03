class Transportation < ApplicationRecord
  belongs_to :participant
  has_one :trip, through: :participant

  CATEGORIES = ['bus', 'train', 'plane', 'car', 'various', 'other']

  validates :mean, inclusion: { in: CATEGORIES }
  validates :origin, :destination, presence: true
end
