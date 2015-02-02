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

      it "saves a cart_token to the session" do 
        post :create, shopping_cart_item: {product_name: "men's tee", size: "s", item_price: 20, quantity: 3}
        expect(session[:cart_token]).to_not be_blank
      end

      it "shopping_cart_items save cart_token from session" do 
        post :create, shopping_cart_item: {product_name: "men's tee", size: "s", item_price: 20, quantity: 3}
        expect(ShoppingCartItem.first.cart_token).to eq(session[:cart_token])
      end

      it "doesn't set a new cart_token if one already exists" do 
        post :create, shopping_cart_item: {product_name: "men's tee", size: "s", item_price: 20, quantity: 3}
        post :create, shopping_cart_item: {product_name: "men's tee", size: "s", item_price: 20, quantity: 3}
        expect(ShoppingCartItem.first.cart_token).to eq(ShoppingCartItem.last.cart_token)
      end
    end

    context "with invalid input" do 
      it "redirects to root path" do 
        post :create, shopping_cart_item: {product_name: "men's tee", size: "s", item_price: "a", quantity: 3}
        expect(response).to redirect_to root_path
      end
      it "doesn't create a new shopping cart item" do 
        post :create, shopping_cart_item: {product_name: "men's tee", size: "s", item_price: "a", quantity: 3}
        expect(ShoppingCartItem.all.count).to eq(0)
      end
    end
  end
end