Fabricator(:shopping_cart_item) do 
  product_name { Faker::Lorem::words(3) }
  size { ['s', 'm', 'l'].sample }
  item_price { 20 }
  quantity { 2 }
  total_price { 40 }
end