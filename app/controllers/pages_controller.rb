class PagesController < ApplicationController
  before_action :set_nav_tab

  def index
    @shopping_cart_item = ShoppingCartItem.new
    @nav_tab = params[:nav_tab] if params[:nav_tab]
    @store_tab = params[:store_tab] if params[:store_tab]
    if params[:t_shirt_tab]
      @t_shirt_tab = params[:t_shirt_tab] 
      @shirts = shirts("female")
    else
      @shirts = shirts("male")
    end
  end

end