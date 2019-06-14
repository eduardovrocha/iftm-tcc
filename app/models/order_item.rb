class OrderItem < ApplicationRecord

  belongs_to :order
  belongs_to :product

  def sub_total
    price * quantity
  end

end
