Fabricator(:tee_shirt) do 
  description { Faker::Lorem::words(10) }
  gender { ["male", "female"].sample }
  price { 20 }
  image_url { "test.jpg"}
end