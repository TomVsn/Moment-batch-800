class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :participants
  has_many :trips, through: :participants
  has_many :owned_trips, class_name: 'Trip', foreign_key: :user_id
  validates :username, presence: true
  has_one_attached :photo

  def participates?(trip)
    participants.find_by(trip: trip).present?
  end
end
