class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles, {:id => false} do |t|
      t.string :ability
      t.integer :user_id
      t.timestamps
    end
  end
end
