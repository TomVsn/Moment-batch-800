class Expense < ApplicationRecord
  belongs_to :participant
  validates :amount, :title, presence: true
end
