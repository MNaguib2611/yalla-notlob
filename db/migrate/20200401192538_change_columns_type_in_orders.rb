class ChangeColumnsTypeInOrders < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
        ALTER TABLE orders MODIFY order_type enum('breakfast', 'dinner', 'lunch');

    SQL
    execute <<-SQL
    ALTER TABLE orders MODIFY status enum('waiting', 'finished', 'cancelled');
    SQL
  end

  def down
    change_column :orders, :order_type, :string
    change_column :orders, :status, :string
  end
end
