class AddForeignKeyFromUsersToUserNotifications < ActiveRecord::Migration[6.0]
  def change
    add_reference :user_notifications, :user, foreign_key: true
  end
end
