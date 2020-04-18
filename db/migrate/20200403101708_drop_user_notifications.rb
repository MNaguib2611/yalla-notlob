class DropUserNotifications < ActiveRecord::Migration[6.0]
  def up
    drop_table :user_notifications
  end
  def down
    create_table :user_notifications do |t|	
      t.string :notification	
      t.string :status	

      t.timestamps	
    end	
  end
end
