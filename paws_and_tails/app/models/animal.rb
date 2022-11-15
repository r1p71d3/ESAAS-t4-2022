class Animal < ApplicationRecord
  belongs_to :breeder

  def self.get_breeder(animal_id)
    animal = Animal.find(animal_id)
    breeder = Breeder.find(animal.breeder_id)
    return breeder
  end

  def self.location_refine(city, country)
    animals = nil
    if city.nil? && country.nil?
      # find unrestricted
      animals = Animal.all
    elsif !city.nil? && country.nil?
      # find city
      animals = Animal.joins(:breeder).where(breeders: {city: city})
    elsif city.nil? && !country.nil?
      # find country
      animals = Animal.joins(:breeder).where(breeders: {country: country})
    else
      # find city and country
      animals = Animal.joins(:breeder).where(breeders: {city: city, country: country})
    end
    return animals.order(:name)
  end
end
