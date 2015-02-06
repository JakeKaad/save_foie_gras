Rails.application.routes.draw do
  root 'pages#index'
  post '/update_shopping_cart', to: 'shopping_cart_items#update_shopping_cart'

  resources 'pages', only: [:index]

  resources "shopping_cart_items", only: [:create, :index, :destroy]

end
