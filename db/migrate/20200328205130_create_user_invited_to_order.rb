class CreateUserInvitedToOrder < ActiveRecord::Migration[6.0]
  def change
    create_table :user_invited_to_orders do |t|
      t.references :host, foreign_key: { to_table:'users' }
      t.references :guest, foreign_key: { to_table:'users' }
      t.references :order, foreign_key: { to_table:'orders' }
      t.string     :status

      t.timestamps
    end
  end
end
