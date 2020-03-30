class DropUserFriends < ActiveRecord::Migration[6.0]
  def change
    drop_table :user_friends
  end
end
