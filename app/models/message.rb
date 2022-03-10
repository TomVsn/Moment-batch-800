class Message < ApplicationRecord
  belongs_to :participant
  belongs_to :trip
  validates :content, presence: true
  belongs_to :recipient, class_name: "User"
  has_many :notifications, as: :recipients

  after_create_commit do
    NotificationBroadcastJob.perform_later(self)
  end

  private

  def notify_recipient
    NewMessageNotification.with(message: self).deliver(recipient)
  end


end
