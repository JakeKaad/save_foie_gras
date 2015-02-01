class ShoppingCartItem < ActiveRecord::Base

  validates_presence_of :size, :item_price, :total_price, :product_name, :quantity
  validates_numericality_of :total_price, :item_price
  validates_numericality_of :quantity, only_integer: true 

  def set_total_price
    self.total_price = item_price * quantity
  end
end