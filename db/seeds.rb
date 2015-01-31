# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
TeeShirt.create(description: "Men's I love Foie Gras Tee",
                price: 20,
                gender: "male",
                image_url: "mensshirt.jpg")
TeeShirt.create(description: "Women's I love Foie Gras Tee",
                price: 20,
                gender: "female",
                image_url: "womensshirt.jpg")