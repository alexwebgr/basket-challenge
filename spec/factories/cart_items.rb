FactoryBot.define do
  factory :cart_item do
    product
    order
    product_quantity { 0 }
    product_discount_total { 0 }
    product_total_price { 0 }
  end
end
