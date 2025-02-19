class Product < ApplicationRecord
  PRODUCTS = [
    MUG = "MUG",
    TSHIRT = "TSHIRT",
    HOODIE = "HOODIE"
  ]
  validates :code, presence: true, uniqueness: true
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
