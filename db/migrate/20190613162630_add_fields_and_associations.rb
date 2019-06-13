class AddFieldsAndAssociations < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :description, :string
    add_column :products, :img_url, :string
    add_column :products, :category_id, :integer
  end
end
