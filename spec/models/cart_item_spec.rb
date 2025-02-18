require 'rails_helper'

RSpec.describe CartItem, type: :model do
  subject { build(:cart_item, product_quantity: 1, product_discount_total: 0, product_total_price: 0) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a product_quantity' do
    subject.product_quantity = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a negative product_quantity' do
    subject.product_quantity = -1.00
    expect(subject).to_not be_valid
  end

  it 'is not valid without a product_discount_total' do
    subject.product_discount_total = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a negative product_discount_total' do
    subject.product_discount_total = -1.00
    expect(subject).to_not be_valid
  end

  it 'is not valid without a product_total_price' do
    subject.product_total_price = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a negative product_total_price' do
    subject.product_total_price = -1.00
    expect(subject).to_not be_valid
  end
end
