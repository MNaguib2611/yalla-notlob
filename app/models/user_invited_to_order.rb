class UserInvitedToOrder < ApplicationRecord
    validates :host_id, :guest_id, :order_id, :status, presence: true
    self.table_name = "user_invited_to_orders"
    belongs_to :order
    belongs_to :host, :class_name => "User"
    belongs_to :guest, :class_name => "User"
    after_commit :create_notifications, on: :create
    after_commit :update_notification, on: :update

    private

    def create_notifications
        Notification.create do |notification|
            notification.notify_type = 'invitation'
            notification.actor = self.host #host
            notification.user = self.guest
            notification.target = self
            notification.second_target = self.order
        end
    end

    def update_notification
        Notification.create do |notification|
            notification.notify_type = 'invitation_update'
            notification.actor = self.guest
            notification.user = self.host
            notification.target = self
            notification.second_target = self.order
        end
    end
end
