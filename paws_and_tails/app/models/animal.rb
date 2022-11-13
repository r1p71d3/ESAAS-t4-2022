class Animal < ApplicationRecord
  belongs_to :breeder

  def self.get_breeder(animal_id)
    animal = Animal.find(animal_id)
    breeder = Breeder.find(animal.breeder_id)
    return breeder
  end
end
