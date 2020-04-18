class DropUserFriends < ActiveRecord::Migration[6.0]
  
  def up
    drop_table :user_friends
  end

  def down
    create_table :user_friends do |t|
      t.string :email

      t.timestamps
    end
  end
end
