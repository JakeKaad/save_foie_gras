class AddCartTokenToShoppingCartItems < ActiveRecord::Migration
  def change
    add_column :shopping_cart_items, :cart_token, :string
  end
end
