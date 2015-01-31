class PagesController < ApplicationController

  def index
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