class Order < ApplicationRecord

  belongs_to :user
  has_many :products, :through => :order_items
  has_many :order_items

  # data scope
  scope :between_dates_status, -> (date_start, date_finish, order_status) {
    where(moment: date_start..date_finish, order_status: order_status)
  }
  scope :between_dates, -> (date_start, date_finish) {
    all.where(moment: date_start..date_finish)
  }
  scope :status, -> (order_status) {
    where(order_status: order_status)
  }

  def self.search_params(params)
    order_params = [params['order']['date-start'], params['order']['date-finish'], params['order']['status']]
    if order_params[0].blank? && order_params[1].blank? && !order_params[2].blank?
      return Order.status(order_params[2])
    end
    if !order_params[0].blank? && !order_params[1].blank? && order_params[2].blank?
      return Order.between_dates(order_params[0], order_params[1])
    end
    if !order_params[0].blank? && !order_params[1].blank? && !order_params[2].blank?
      return Order.between_dates_status(order_params[0], order_params[1], order_params[2],)
    end
    return Order.all
  end

  def self.create_user_order(user_id, order_items)
    ActiveRecord::Base.transaction do
      @order = Order.create({moment: Date.today, order_status: 0, user_id: user_id})
      order_items.each do |index, item|
        OrderItem.create!({order_id: @order.id, product_id: item[:product_id], quantity: item[:quantity], price: item[:price]})
      end
    end
    @order
  end

  def total
    sum = 0
    order_items.each do |item|
      sum = sum + item.sub_total
    end
    sum
  end

  def self.load_user_orders(user_id)
    Order.all.where(:user_id => user_id)
  end

  def self.last_user_order(user_id)
    User.find(user_id).orders.last
  end

end
