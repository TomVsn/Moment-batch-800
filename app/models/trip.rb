class Trip < ApplicationRecord
  belongs_to :user
  has_many :accomodations, dependent: :destroy
  has_many :transportations, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :participants, dependent: :destroy
  # has_many :user_participants, :through => :participants, :source => <name>'
  has_many :user_participants, through: :participants, source: :user
  validates :start_date, :end_date, :title, presence: true
end
