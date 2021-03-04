Rails.application.routes.draw do
  root to: 'products#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products, only: [:new, :create, :index]
  resources :items, only: [:create]
  post '/carts', to: 'carts#close_cart'
end
