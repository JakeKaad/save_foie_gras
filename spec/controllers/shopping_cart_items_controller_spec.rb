require 'spec_helper'

describe ShoppingCartItemsController do 
  describe "POST new" do 
    context "with valid input" do
      it "should redirect to shopping cart" do 
        post :new
        expect(response).to redirect_to shopping_cart_items_path
      end
      it "should create a valid shopping cart item"
    end
  end
end