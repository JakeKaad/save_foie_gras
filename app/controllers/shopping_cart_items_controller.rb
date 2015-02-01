class ShoppingCartItemsController < ApplicationController

  def index 
  end

  def create
    shopping_cart_item = ShoppingCartItem.new(shopping_cart_item_params)
    shopping_cart_item.set_total_price
    shopping_cart_item.save
    redirect_to shopping_cart_items_path
  end


  private

  def shopping_cart_item_params
    params.require(:shopping_cart_item).permit(:product_name, :item_price, :quantity, :size)
  end
end