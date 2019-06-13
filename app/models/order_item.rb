class OrderItem < ApplicationRecord

  # validates_uniqueness_of :order_id, :scope => [:order_id, :product_id]

  # validates_uniqueness_of :order_id, scope: :order_id
  # validates_uniqueness_of :product_id, scope: :product_id

  belongs_to :order
  belongs_to :product

end
