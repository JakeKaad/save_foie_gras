require 'spec_helper'

describe TeeShirt do 
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:image_url) }
  it { should validate_presence_of(:gender) }
end