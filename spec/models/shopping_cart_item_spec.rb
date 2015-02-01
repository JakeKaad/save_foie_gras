require 'spec_helper'

describe ShoppingCartItem do
  it { should validate_presence_of(:quantity) }
  it { should validate_presence_of(:size) }
  it { should validate_presence_of(:item_price) }
  it { should validate_presence_of(:total_price) }
  it { should validate_presence_of(:product_name) }
  it { should validate_numericality_of(:total_price) }
  it { should validate_numericality_of(:item_price) }
  it { should validate_numericality_of(:quantity).only_integer }

  describe "#set_total_price" do 
    it "sets the total price to be a product of quantity and item_price" do 
      tshirts = ShoppingCartItem.new(item_price: 20, quantity: 2)
      tshirts.set_total_price
      expect(tshirts.total_price).to eq( 40)
    end
  end
end