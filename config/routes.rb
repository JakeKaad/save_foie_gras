Rails.application.routes.draw do
  root 'pages#index'

  resources 'pages', only: [:index]

  resources "shopping_cart_items", only: [:create, :index, :destroy]
end
