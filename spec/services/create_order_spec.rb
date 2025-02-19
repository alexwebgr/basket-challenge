require 'rails_helper'

RSpec.describe CreateOrder do
  let(:cart_items) { nil }
  subject { described_class.call(cart_items) }

  context "when there is 1 t-shirt" do
    let(:cart_items) { "1 #{Product::TSHIRT}" }
    let!(:tshirt) { create(:product, :tshirt) }

    it "returns the totals" do
      expect(subject) .to eq({
        items: "1 TSHIRT",
        totals: { subtotal_price: 15.00, total_discount: 0.00, total_price: 15.00 }
      })
    end
  end

  context "when there are 3 t-shirts" do
    let(:cart_items) { "3 #{Product::TSHIRT}" }
    let!(:tshirt) { create(:product, :tshirt) }

    it "returns the totals" do
      expect(subject) .to eq({
        items: "3 TSHIRT",
        totals: { subtotal_price: 45.00, total_discount: 13.50, total_price: 31.50 }
      })
    end
  end
end
