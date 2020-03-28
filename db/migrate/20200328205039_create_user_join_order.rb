class CreateUserJoinOrder < ActiveRecord::Migration[6.0]
  def change
    create_table :user_join_orders do |t|
      t.references :order, foreign_key: { to_table:'orders' }
      t.references :user, foreign_key: { to_table:'users' }

      t.timestamps
    end
  end
end
