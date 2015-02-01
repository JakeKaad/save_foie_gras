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
end