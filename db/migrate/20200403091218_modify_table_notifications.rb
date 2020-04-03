class ModifyTableNotifications < ActiveRecord::Migration[6.0]
  def change
    execute <<-SQL
      ALTER TABLE notifications MODIFY notify_type enum('invitation', 'invitation_update');
    SQL
  end
end
