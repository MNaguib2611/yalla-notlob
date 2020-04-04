class ModifyTableUserNotifications < ActiveRecord::Migration[6.0]
  def change

    execute <<-SQL
    ALTER TABLE user_notifications ADD notification_type enum('join', 'invitation');
    SQL
    execute <<-SQL
      ALTER TABLE user_notifications MODIFY status enum('read', 'unread');
    SQL

  end
end
