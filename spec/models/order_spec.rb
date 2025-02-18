require 'rails_helper'

RSpec.describe Order, type: :model do
  subject { build(:order) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
end
