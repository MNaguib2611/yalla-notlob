class CreateUserFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :user_friends do |t|
      t.string :email

      t.timestamps
    end
  end
end
