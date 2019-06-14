Rails.application.routes.draw do

  namespace :admin do

    root :to => 'products#index'

    resources :order_items
    resources :orders
    resources :users
    resources :products
    resources :categories

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
