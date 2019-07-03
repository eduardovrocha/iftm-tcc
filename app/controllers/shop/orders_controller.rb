class Shop::OrdersController < Shop::ShopController
  before_action :authenticate_user!

  # GET /orders/new
  def new
    @order = Order.create_user_order(params['order']['user_id'], params['order']['order_items'])
  end

end