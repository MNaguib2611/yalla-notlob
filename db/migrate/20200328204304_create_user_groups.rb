class CreateUserGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :user_groups do |t|
      t.references :group, foreign_key: { to_table:'groups' }
      t.references :user, foreign_key: { to_table:'users' }
    end
  end
end
