class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :type
      t.string :restaurant
      t.string :menu_img
      t.integer :joined_num
      t.integer :invited_num
      t.string :status
      t.float   :total

      t.timestamps
    end
  end
end
