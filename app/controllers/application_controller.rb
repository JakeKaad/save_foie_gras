class ApplicationController < ActionController::Base
  helper_method :shirts

  def shirts(gender)
    TeeShirt.where(gender: gender)
  end

  

  protect_from_forgery with: :exception
end
