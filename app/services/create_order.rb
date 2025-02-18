# frozen_string_literal: true

class CreateOrder
  attr_reader :cart_items

  def self.call(cart_items)
    new(cart_items).call
  end

  def initialize(cart_items)
    @cart_items = cart_items
  end

  def call
    # codes = extract_items.pluck(:code)
    # Product.where(code: codes)
    order = Order.create
    extract_items.each do |item|
      product = Product.find_by(code: item[:code])
      return if product.nil?

      order.cart_items.create(
        product: product,
        product_quantity: item[:quantity],
        product_total_price: item[:quantity] * product.price,
        product_discount_total: calculate_discount(item[:code]),
      )
    end

    {
      items: cart_items,
      total: order.cart_items.sum(:product_total_price)
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

  def calculate_discount(product_code)
    case product_code
    when "MUG"
        calculate_mug_discount
    when "TSHIRT"
        calculate_tshirt_discount
    else
        0
    end
  end

  def calculate_mug_discount
    0
  end

  def calculate_tshirt_discount
    0
  end
end
