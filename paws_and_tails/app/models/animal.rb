class Animal < ApplicationRecord
  validates :name, presence: true
  validates :animal_type, presence: true
  validates :breed, presence: true
  validates :price, presence: true, numericality: { only_numeric: true }
  validates :anticipated_birthday, presence: true
  validates :breeder_id, presence: true
  belongs_to :breeder

  def self.get_breeder(animal_id)
    animal = Animal.find(animal_id)
    breeder = Breeder.find(animal.breeder_id)
    return breeder
  end

  def self.search(search, city = nil, country = nil)
    query = joins(:breeder).where("animal_type LIKE :search OR breed LIKE :search OR animals.name LIKE :search OR breeders.name LIKE :search", search: "%#{search}%")

    if city || country
      query = query.where(breeders: {city: city}) if city
      query = query.where(breeders: {country: country}) if country
    end

    query
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
    return animals
  end
end
