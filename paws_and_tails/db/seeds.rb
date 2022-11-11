# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

breeders = [
  {
    "name": "Ragdoll Breeder",
    "city": "Boston",
    "country": "United States",
    "price_level": "$$$",
    "address": "Hello Street, Boston, MA"
  }
]

animals = [
  {
    "name": "Hello Kitty",
    "animal_type": "Cat",
    "breed": "Ragdoll",
    "price": 100,
    "anticipated_birthday": "2023-09-01",
    "breeder_id": 1
  }
]

breeders.each do | breeder |
  Breeder.create!(breeder)
end

animals.each do | animal |
  Animal.create!(animal)
end
