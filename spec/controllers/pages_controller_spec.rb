require 'spec_helper'

describe PagesController do 
  describe "GET index" do 
    context "default view" do
      it "doesn't assign @nav_tab a value with no nav_tabs params" do 
        get "index"
        expect(assigns(:nav_tab)).to be_nil
      end

      it "sets @nav_tab correctly" do 
        get "index", nav_tab: "farms" 
        expect(assigns(:nav_tab)).to eq("farms")
      end
    end

    context "store tab" do 
      it "doesn't assign @store_tab with no store_tab param" do 
        get "index"
        expect(assigns(:store_tab)).to be_nil 
      end

      it "sets @store_tab correctly" do 
        get "index", store_tab: "hats"
        expect(assigns(:store_tab)).to eq("hats")
      end

      it "sets the t_shirt_tab correctly" do 
        get "index", t_shirt_tab: "womens"
        expect(assigns(:t_shirt_tab)).to eq("womens")
      end
    end
  end
end