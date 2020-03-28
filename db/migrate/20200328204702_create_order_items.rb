class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.string :item, null: false
      t.integer :amount
      t.float   :price
      t.string  :comment
      t.references :order, foreign_key: { to_table:'orders' }
      t.references :user, foreign_key: { to_table:'users' }
    end
  end
end
