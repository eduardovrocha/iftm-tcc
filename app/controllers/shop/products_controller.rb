class Shop::ProductsController < Shop::ShopController
  before_action :set_product, only: [:show]

  # GET /products
  # GET /products.json
  def index

    if (params['product'].nil?)
      @_products = Product.all
    else

      if !(params['product']['name'].blank?) && !(params['product']['category'].blank?)
        @_products = Product.by_name_category(params['product']['name'], params['product']['category'])
      end

      if (params['product']['name'].blank?)
        @_products = Product.by_category(params['product']['category'])
      end

      if (params['product']['category'].blank?)
        @_products = Product.by_name(params['product']['name'])
      end

    end

    @products_size = @_products.count
    # @products = @_products.paginate(page: params[:page], per_page: 6).order('updated_at DESC')
    @products = @_products.paginate(page: params[:page], per_page: 6)

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
