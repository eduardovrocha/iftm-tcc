class Shop::OrdersController < Shop::ShopController
  before_action :authenticate_user!

  # GET /orders/new
  def new
    @order = Order.create_user_order(params['order']['user_id'], params['order']['order_items'])
  end

  def last
    @order = Order.last_user_order(params['user_id'])
  end

end