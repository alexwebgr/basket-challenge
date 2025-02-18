require 'rails_helper'

RSpec.describe Product, type: :model do
  subject { described_class.new(code: 'MUG', name: 'Mug', price: 6.00) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a code' do
    subject.code = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a negative price' do
    subject.price = -1.00
    expect(subject).to_not be_valid
  end

  it 'is not valid without a price' do
    subject.price = nil
    expect(subject).to_not be_valid
  end

  it 'is valid with unique code' do
    Product.create(code: 'MUG', name: 'Mug', price: 6.00)
    new_product = Product.new(code: 'MUG', name: 'Another Mug', price: 7.00)
    expect(new_product).to_not be_valid
  end
end
