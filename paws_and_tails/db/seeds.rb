# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# breeders = [
#   {
#     "name": "Ragdoll Breeder",
#     "city": "Boston",
#     "country": "United States",
#     "price_level": "$$$",
#     "address": "Hello Street, Boston, MA"
#   }
#
# {
#   "name": "Happy Puppies",
#   "city": "New York",
#   "country": "United States",
#   "price_level": "$$$$",
#   "address": "1600 Broadway, New York, NY"
# },
# {
#   "name": "Noble Breed",
#   "city": "Brussels",
#   "country": "Belgium",
#   "price_level": "$$",
#   "address": "David Goffin Street, Brussels, Belgium"
# },
# {
#   "name": "Northwestern Wildcats",
#   "city": "Evanston",
#   "country": "United States",
#   "price_level": "$$$",
#   "address": "2400 Sheridan Road, Evanston, IL"
# },
# {
#   "name": "New China Pets",
#   "city": "Beijing",
#   "country": "China",
#   "price_level": "$",
#   "address": "Sanyuanqiao, Beijing, China"
# },
# {
#   "name": "Rainbow Lively",
#   "city": "Montreal",
#   "country": "Canada",
#   "price_level": "$$$",
#   "address": "Rogers Bank Street, Montreal, Quebec"
# }
# ]

animals = [
  # {
  #   "name": "Hello Kitty",
  #   "animal_type": "Cat",
  #   "breed": "Ragdoll",
  #   "price": 100,
  #   "anticipated_birthday": "2023-09-01",
  #   "breeder_id": 1
  # },
  # {
  #   "name": "Parody",
  #   "animal_type": "Bird",
  #   "breed": "Parrot",
  #   "price": 15,
  #   "anticipated_birthday": "2022-12-13",
  #   "breeder_id": 8
  # },
  # {
  #   "name": "Patriot",
  #   "animal_type": "Cat",
  #   "breed": "British Shorthair",
  #   "price": 240,
  #   "anticipated_birthday": "2023-02-08",
  #   "breeder_id": 7
  # },
  {
    "name": "Sleeping Pajamas",
    "animal_type": "Dog",
    "breed": "Labrador",
    "price": 600,
    "anticipated_birthday": "2022-12-01",
    "breeder_id": 4
  },
  {
    "name": "Sleeping Socks",
    "animal_type": "Dog",
    "breed": "Labrador",
    "price": 612,
    "anticipated_birthday": "2022-12-01",
    "breeder_id": 4
  },
  {
    "name": "Xiaoming",
    "animal_type": "Dog",
    "breed": "Corgi",
    "price": 320,
    "anticipated_birthday": "2023-03-20",
    "breeder_id": 5
  },
  {
    "name": "Cherry",
    "animal_type": "Bird",
    "breed": "Pearl Bird",
    "price": 70,
    "anticipated_birthday": "2022-11-25",
    "breeder_id": 8
  },
  {
    "name": "Willie",
    "animal_type": "Cat",
    "breed": "Wildcat",
    "price": 1500,
    "anticipated_birthday": "2023-01-01",
    "breeder_id": 6
  },
  {
    "name": "Bobby",
    "animal_type": "Dog",
    "breed": "Bull Dog",
    "price": 200,
    "anticipated_birthday": "2022-12-30",
    "breeder_id": 4
  }
]

# breeders.each do | breeder |
#   Breeder.create!(breeder)
# end

animals.each do | animal |
  Animal.create!(animal)
end
