class CreateShoppingCartItems < ActiveRecord::Migration
  def change
    create_table :shopping_cart_items do |t|
      t.string :product_name
      t.integer :item_price
      t.integer :total_price
      t.string :size
      t.integer :quantity
    end
  end
end
