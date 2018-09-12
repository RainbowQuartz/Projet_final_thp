class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user
  has_many :notifications, as: :event

  after_create :send_notification

  private
    def send_notification(message)
      message.notifications.create(user: message.recipient)
    end
  end

end
