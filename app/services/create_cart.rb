# frozen_string_literal: true

class CreateCart
  TSHIRT_DISCOUNT = 0.3

  attr_reader :cart_items

  def self.call(cart_items)
    new(cart_items).call
  end

  def initialize(cart_items)
    @cart_items = cart_items
  end

  def call
    codes = extract_items.pluck(:code)
    products = Product.where(code: codes).each_with_object({}) do |product, memo|
      memo[product.code] = {
        id: product.id,
        price: product.price
      }
    end

    cart = Cart.create
    extract_items.each do |item|
      product = products[item[:code]]
      next if product.nil?

      cart.cart_items.create(
        product_id: product[:id],
        product_quantity: item[:quantity],
        product_total_price: item[:quantity] * product[:price],
        product_discount_total: calculate_discount(item[:code], item[:quantity], product[:price]),
      )
    end

    {
      items: cart_items,
      totals: calculate_totals(cart.cart_items)
    }
  rescue StandardError => e
    { error: e.message }
  end

  private

  def extract_items
    items = cart_items.split(", ")

    items.map do |item|
      quantity, code = item.split(" ")

      {
        quantity: quantity.to_i,
        code: code
      }
    end
  end

  def calculate_totals(items)
    subtotal_price = items.sum(:product_total_price)
    total_discount = items.sum(:product_discount_total)
    {
      subtotal_price: subtotal_price,
      total_discount: total_discount,
      total_price: subtotal_price - total_discount
    }
  end

  def calculate_discount(product_code, quantity, price)
    case product_code
    when Product::MUG
        calculate_mug_discount(quantity, price)
    when Product::TSHIRT
        calculate_tshirt_discount(quantity, price)
    else
        0
    end
  end

  def calculate_mug_discount(quantity, price)
    discount_rate = 0
    discount_step = 0.02
    return discount_rate if quantity < 10

    if quantity < 150
      discount_rate = discount_step * quantity.to_s[0..-2].to_i
    else
      discount_rate = 0.30
    end

    price * quantity * discount_rate
  end

  def calculate_tshirt_discount(quantity, price)
    return 0 if quantity < 3

    price * quantity * TSHIRT_DISCOUNT
  end
end
