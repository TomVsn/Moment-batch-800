class Accomodation < ApplicationRecord
  belongs_to :trip
  has_many :accomodation_votes
  validates :url, :address, presence: true

  def set_defaults
    self.confirmed ||= false
    self.picked ||= false
  end
end
