class CreateUserNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :user_notifications do |t|
      t.string :notification
      t.string :status

      t.timestamps
    end
  end
end
