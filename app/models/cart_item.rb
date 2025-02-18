class CartItem < ApplicationRecord
  validates :product_quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :product_discount_total, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :product_total_price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :product
  belongs_to :order
end
