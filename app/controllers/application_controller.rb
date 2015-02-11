class ApplicationController < ActionController::Base
  helper_method :shirts

  def shirts(gender)
    TeeShirt.where(gender: gender)
  end

  def set_nav_tab
    @nav_tab = params[:nav_tab] if params[:nav_tab]
  end
  

  protect_from_forgery with: :exception
end
