class Chatroom < ApplicationRecord
  belongs_to :trip
  belongs_to :participant
end
