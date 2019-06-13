class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.date :moment
      t.integer :order_status
      t.integer :user_id
      t.timestamps
    end
  end
end
