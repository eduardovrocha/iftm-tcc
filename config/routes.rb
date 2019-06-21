Rails.application.routes.draw do

  root :to => 'shop/products#index'

  namespace :admin do

    root :to => 'products#index'

    resources :order_items
    resources :orders
    resources :users
    resources :products
    resources :categories

  end

  namespace :shop do

    root :to => 'products#index'

    get '/products', to: 'products#index'
    get '/products/:id', to: 'products#show', as: 'product_detail'
    get '/cart', to: 'carts#show', as: 'cart'

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
