class Shop::ProductsController < Shop::ShopController
  before_action :set_product, only: [:show]

  # GET /products
  # GET /products.json
  def index
    if (params['product'].nil?)
      @_products = Product.all
    else
      @_products = Product.search_params(params)
    end
    @products_size = @_products.count
    @products = @_products.paginate(page: params[:page], per_page: 5)
  end

  def show
    @products = Product.first(4)
    @categories = Category.all
  end

  def cart
    if (params['products'])
      @products = Product.first(3)
    else
      redirect_to '/'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

end
