class ModifyTableUserNotifications < ActiveRecord::Migration[6.0]
  def up

    execute <<-SQL
    ALTER TABLE user_notifications ADD notification_type enum('join', 'invitation');
    SQL
    execute <<-SQL
      ALTER TABLE user_notifications MODIFY status enum('read', 'unread');
    SQL

  end

  def down
    # remove_column :user_notifications, :notification_type
    change_column :user_notifications, :status, :string
  end

end
