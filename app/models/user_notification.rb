class UserNotification < ApplicationRecord
    belongs_to :user
    scope :unread_notifications, -> {where(status: "unread")}
    scope :read_notifications, -> {where(status: "read")}
end
