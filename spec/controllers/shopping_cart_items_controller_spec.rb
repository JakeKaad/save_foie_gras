require 'spec_helper'

describe ShoppingCartItemsController do 

  describe "GET index" do 
    it "assigns a cart_token if there is none in session" do 
      get :index
      expect(session[:cart_token]).to_not be_blank
    end

    it "doesn't assign a cart token if there is already one in session" do 
      get :index
      cart_token = session[:cart_token]
      get :index
      expect(session[:cart_token]).to eq(cart_token)
    end

    it "assigns @shopping_cart_items" do 
      get :index 
      expect(assigns(:shopping_cart_items)).to_not be_nil
    end

    it "assigns @shopping_cart_items that match cart_token" do 
      cart_item1 = Fabricate(:shopping_cart_item, cart_token: "abc")
      cart_item2 = Fabricate(:shopping_cart_item, cart_token: "abc")
      session[:cart_token] = "abc"
      get :index
      expect(assigns(:shopping_cart_items)).to eq([cart_item1, cart_item2])
    end
    
  end

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

  describe "DELETE destroy" do 
    let(:shopping_cart_item) { Fabricate(:shopping_cart_item, cart_token: "abc") }

    it "redirects to the shopping cart" do
      delete :destroy, id: shopping_cart_item.id
      expect(response).to redirect_to shopping_cart_items_path
    end

    it "deletes the shopping cart item" do 
      delete :destroy, id: shopping_cart_item.id 
      expect(ShoppingCartItem.all.empty?).to be_truthy
    end 
  end

  describe "POST update_shopping_cart" do
    context "with valid input" do 
      let(:shopping_cart_item) { Fabricate(:shopping_cart_item, cart_token: "abc", quantity: 1, size: "S", item_price: 20) }

      it "redirects to the shopping cart" do 
        post :update_shopping_cart,  shopping_cart_items: [{id: shopping_cart_item.id, quantity: 3, size: "S"}]
        expect(response).to redirect_to redirect_to shopping_cart_items_path
      end 

      it "updates the shopping cart item's quantity" do 
        post :update_shopping_cart,  shopping_cart_items: [{id: shopping_cart_item.id, quantity: 3, size: "S"}]
        expect(shopping_cart_item.reload.quantity).to eq(3)
      end

      it "updates the shopping cart item's size" do 
        post :update_shopping_cart,  shopping_cart_items: [{id: shopping_cart_item.id, quantity: 3, size: "L"}]
        expect(shopping_cart_item.reload.size).to eq("L")
      end

      it "updates the shopping cart item's total_price if quantity changes" do 
        post :update_shopping_cart,  shopping_cart_items: [{id: shopping_cart_item.id, quantity: 3, size: "L"}]
        expect(shopping_cart_item.reload.total_price).to eq(60)
      end
    end

    context "with invalid input" do 
      let(:shopping_cart_item) { Fabricate(:shopping_cart_item, cart_token: "abc", quantity: 1, size: "S", item_price: 20) }

      it "redirects to the shopping cart" do 
        post :update_shopping_cart,  shopping_cart_items: [{id: shopping_cart_item.id, quantity: "p", size: 3}]
        expect(response).to redirect_to shopping_cart_items_path
      end

      it "doesn't update the shopping cart with an invalid quantity" do 
        post :update_shopping_cart,  shopping_cart_items: [{id: shopping_cart_item.id, quantity: "p", size: 3}]
        expect(shopping_cart_item.reload.quantity).to eq(1)
      end

      it "doesn't update the shopping cart with an invalid size" do 
        post :update_shopping_cart,  shopping_cart_items: [{id: shopping_cart_item.id, quantity: "p", size: 3}]
        expect(shopping_cart_item.reload.size).to eq("S")
      end
    end

  end
end