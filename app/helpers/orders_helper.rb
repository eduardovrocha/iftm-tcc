module OrdersHelper

  def show_order_status(status)
    order_status = OrderStatus.statuses.find {|key, value| value == status}.first
    return order_status.humanize
  end

end