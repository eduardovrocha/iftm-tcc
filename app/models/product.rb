class Product < ApplicationRecord

  belongs_to :category
  has_many :orders, :through => :order_items
  has_many :order_items

  # data scope
  scope :by_name, -> (name) {
    where(name: name)
  }
  scope :by_category, -> (category_id) {
    all.where(category_id: category_id)
  }
  scope :by_name_category, -> (name, category_id) {
    where(name: name, category_id: category_id)
  }

  def self.search_params(params)
    product_params = [params['product']['name'], params['product']['category']]
    if product_params[0].blank? && !product_params[1].blank?
      return Product.by_category(product_params[1])
    end
    if !product_params[0].blank? && product_params[1].blank?
      return Product.by_name(product_params[0])
    end
    if !product_params[0].blank? && !product_params[1].blank?
      return Product.by_name_category(product_params[0], product_params[1])
    end
    return Product.all
  end

end