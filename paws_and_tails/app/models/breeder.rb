class Breeder < ApplicationRecord
  has_many :animals, dependent: :destroy

  def self.get_animals(breeder_id)
    animals = Animal.where(:breeder_id => breeder_id)
    return animals
  end

end
