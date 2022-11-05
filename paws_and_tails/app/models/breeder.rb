class Breeder < ApplicationRecord
  has_many :animals, dependent: :destroy
end
