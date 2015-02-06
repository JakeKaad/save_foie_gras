class ShoppingCartItemsController < ApplicationController
  before_action :assign_cart_token

  def index 
    @shopping_cart_items = ShoppingCartItem.where(cart_token: session[:cart_token])
  end

  def create
    shopping_cart_item = ShoppingCartItem.new(shopping_cart_item_params)
    shopping_cart_item.set_total_price
    shopping_cart_item.cart_token = session[:cart_token]
    if shopping_cart_item.save
      redirect_to shopping_cart_items_path
    else
      redirect_to root_path
    end
  end

  def update_shopping_cart
    update_shopping_cart_items
    redirect_to shopping_cart_items_path
  end

  def destroy
    find_shopping_cart_item(params[:id])
    @shopping_cart_item.delete
    redirect_to shopping_cart_items_path
  end


  private

  def shopping_cart_item_params
    params.require(:shopping_cart_item).permit(:product_name, :item_price, :quantity, :size)
  end

  def create_cart_token
    rand(36**8).to_s(36)
  end

  def assign_cart_token
    session[:cart_token] ||= create_cart_token
  end

  def find_shopping_cart_item(id)
    @shopping_cart_item = ShoppingCartItem.find(id)
  end

  def update_shopping_cart_items
    ActiveRecord::Base.transaction do
      params[:shopping_cart_items].each do |shopping_cart_item_data|
        find_shopping_cart_item(shopping_cart_item_data[:id])
        @shopping_cart_item.update_attributes(quantity: shopping_cart_item_data[:quantity], size: shopping_cart_item_data[:size])
        @shopping_cart_item.set_total_price
        @shopping_cart_item.save
      end
    end
  end

end