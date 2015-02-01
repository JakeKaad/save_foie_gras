class ShoppingCartItemsController < ApplicationController

  def new
    redirect_to shopping_cart_items_path
  end
end