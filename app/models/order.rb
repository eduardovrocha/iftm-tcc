class Order < ApplicationRecord

  belongs_to :user
  has_many :products, :through => :order_items
  has_many :order_items

  def total
    sum = 0
    order_items.each do |item|
      sum = sum + item.sub_total
    end
    sum
  end

end
