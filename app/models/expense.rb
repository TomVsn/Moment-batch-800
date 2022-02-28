class Expense < ApplicationRecord
  belongs_to :participant
  validates :amount, :title, :mutual, presence: true
end
