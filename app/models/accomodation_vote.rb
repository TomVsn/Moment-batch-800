class AccomodationVote < ApplicationRecord
  belongs_to :participant
  belongs_to :accomodation

  def set_defaults
    self.votes ||= 0
  end
end
