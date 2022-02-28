class AccomodationVote < ApplicationRecord
  belongs_to :participant
  belongs_to :accomodation
end
