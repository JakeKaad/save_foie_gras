require 'spec_helper'

describe ShoppingCartItemsController do 
  describe "POST new" do 
    context "with valid input" do
      it "should redirect to shopping cart" do 
        post :create, shopping_cart_item: {product_name: "men's tee", size: "s", item_price: 20, quantity: 3}
        expect(response).to redirect_to shopping_cart_items_path
      end

      it "should create a valid shopping cart item" do 
        post :create, shopping_cart_item: {product_name: "men's tee", size: "s", item_price: 20, quantity: 3}
        expect(ShoppingCartItem.all.count).to eq(1)
      end
      
    end
  end
end