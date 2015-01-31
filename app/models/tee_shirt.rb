class TeeShirt < ActiveRecord::Base
  validates_presence_of :description, :price, :gender, :image_url
end