class ModifyTableNotifications < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      ALTER TABLE notifications MODIFY notify_type enum('invitation', 'invitation_update');
    SQL
  end 

  def down
    change_column :notifications, :notify_type, :string
  end
end
