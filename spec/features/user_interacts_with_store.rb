require 'spec_helper'

feature "shopping cart link is only showing up when there is a session active" do 
  scenario "user navigates through shopping" do 
    
    visit root_path
    expect(page).to_not have_text "Shopping Cart"

    visit shopping_cart_items_path
    expect(page).to have_text "Shopping Cart"

    visit root_path
    expect(page).to have_text "Shopping Cart"
  end
end