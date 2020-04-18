class AddForeignKeyFromUsersToUserNotifications < ActiveRecord::Migration[6.0]
  
  def up
    add_reference :user_notifications, :user, foreign_key: true
  end

  def down
    # remove_reference :user_notifications, :user, foreign_key: true
  end
end
