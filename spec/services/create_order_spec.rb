require 'rails_helper'

RSpec.describe CreateOrder do
  let(:cart_items) { nil }
  subject { described_class.call(cart_items) }

  context "when there is 1 t-shirt" do
    let(:cart_items) { "1 #{Product::TSHIRT}" }
    let!(:tshirt) { create(:product, :tshirt) }

    it "returns the totals" do
      expect(subject) .to eq({
        items: "1 #{Product::TSHIRT}",
        totals: { subtotal_price: 15.00, total_discount: 0.00, total_price: 15.00 }
      })
    end
  end

  context "when there are 3 t-shirts" do
    let(:cart_items) { "3 #{Product::TSHIRT}" }
    let!(:tshirt) { create(:product, :tshirt) }

    it "returns the totals" do
      expect(subject) .to eq({
        items: "3 #{Product::TSHIRT}",
        totals: { subtotal_price: 45.00, total_discount: 13.50, total_price: 31.50 }
      })
    end
  end

  context "when there are 9 mugs" do
    let!(:mug) { create(:product, :mug) }
    let(:cart_items) { "9 #{Product::MUG}" }

    it "returns the totals" do
      expect(subject) .to eq({
        items: "9 #{Product::MUG}",
        totals: { subtotal_price: 54.00, total_discount: 0.00, total_price: 54.00 }
      })
    end
  end

  context "when there are 10 mugs" do
    let!(:mug) { create(:product, :mug) }
    let(:cart_items) { "10 #{Product::MUG}" }

    it "returns the totals" do
      expect(subject) .to eq({
        items: "10 #{Product::MUG}",
        totals: { subtotal_price: 60.00, total_discount: 1.20, total_price: 58.80 }
      })
    end
  end

  context "when there are 19 mugs" do
    let!(:mug) { create(:product, :mug) }
    let(:cart_items) { "19 #{Product::MUG}" }

    it "returns the totals" do
      expect(subject) .to eq({
        items: "19 #{Product::MUG}",
        totals: { subtotal_price: 114.00, total_discount: 2.28, total_price: 111.72 }
      })
    end
  end

  context "when there are 20 mugs" do
    let!(:mug) { create(:product, :mug) }
    let(:cart_items) { "20 #{Product::MUG}" }

    it "returns the totals" do
      expect(subject) .to eq({
        items: "20 #{Product::MUG}",
        totals: { subtotal_price: 120.00, total_discount: 4.80, total_price: 115.20 }
      })
    end
  end

  context "when there are 30 mugs" do
    let!(:mug) { create(:product, :mug) }
    let(:cart_items) { "30 #{Product::MUG}" }

    it "returns the totals" do
      expect(subject) .to eq({
        items: "30 #{Product::MUG}",
        totals: { subtotal_price: 180.00, total_discount: 10.80, total_price: 169.20 }
      })
    end
  end

  context "when there are 149 mugs" do
    let!(:mug) { create(:product, :mug) }
    let(:cart_items) { "149 #{Product::MUG}" }

    it "returns the totals" do
      expect(subject) .to eq({
        items: "149 #{Product::MUG}",
        totals: { subtotal_price: 894.00, total_discount: 250.32, total_price: 643.68 }
      })
    end
  end

  context "when there are 150 mugs" do
    let!(:mug) { create(:product, :mug) }
    let(:cart_items) { "150 #{Product::MUG}" }

    it "returns the totals" do
      expect(subject) .to eq({
        items: "150 #{Product::MUG}",
        totals: { subtotal_price: 900.00, total_discount: 270.00, total_price: 630.00 }
      })
    end
  end

  context "when there are 1500 mugs" do
    let!(:mug) { create(:product, :mug) }
    let(:cart_items) { "1500 #{Product::MUG}" }

    it "returns the totals" do
      expect(subject) .to eq({
        items: "1500 #{Product::MUG}",
        totals: { subtotal_price: 9000.00, total_discount: 2700.00, total_price: 6300.00 }
      })
    end
  end

  context "when there are 9 mugs, 2 t-shirts and 1 hoodie" do
    let!(:mug) { create(:product, :mug) }
    let!(:tshirt) { create(:product, :tshirt) }
    let!(:hoodie) { create(:product, :hoodie) }
    let(:cart_items) { "9 #{Product::MUG}, 2 #{Product::TSHIRT}, 1 #{Product::HOODIE}" }

    it "returns the totals" do
      expect(subject) .to eq({
        items: "9 #{Product::MUG}, 2 #{Product::TSHIRT}, 1 #{Product::HOODIE}",
        totals: { subtotal_price: 104.00, total_discount: 0.00, total_price: 104.00 }
      })
    end
  end

  context "when there are 10 mugs, 2 t-shirts and 1 hoodie" do
    let!(:mug) { create(:product, :mug) }
    let!(:tshirt) { create(:product, :tshirt) }
    let!(:hoodie) { create(:product, :hoodie) }
    let(:cart_items) { "10 #{Product::MUG}, 2 #{Product::TSHIRT}, 1 #{Product::HOODIE}" }

    it "returns the totals" do
      expect(subject) .to eq({
        items: "10 #{Product::MUG}, 2 #{Product::TSHIRT}, 1 #{Product::HOODIE}",
        totals: { subtotal_price: 110.00, total_discount: 1.20, total_price: 108.80 }
      })
    end
  end

  context "when there are 10 mugs, 3 t-shirts and 1 hoodie" do
    let!(:mug) { create(:product, :mug) }
    let!(:tshirt) { create(:product, :tshirt) }
    let!(:hoodie) { create(:product, :hoodie) }
    let(:cart_items) { "10 #{Product::MUG}, 3 #{Product::TSHIRT}, 1 #{Product::HOODIE}" }

    it "returns the totals" do
      expect(subject) .to eq({
        items: "10 #{Product::MUG}, 3 #{Product::TSHIRT}, 1 #{Product::HOODIE}",
        totals: { subtotal_price: 125.00, total_discount: 14.70, total_price: 110.30 }
      })
    end
  end

  context "when there are 20 mugs, 3 t-shirts and 1 hoodie" do
    let!(:mug) { create(:product, :mug) }
    let!(:tshirt) { create(:product, :tshirt) }
    let!(:hoodie) { create(:product, :hoodie) }
    let(:cart_items) { "20 #{Product::MUG}, 3 #{Product::TSHIRT}, 1 #{Product::HOODIE}" }

    it "returns the totals" do
      expect(subject) .to eq({
        items: "20 #{Product::MUG}, 3 #{Product::TSHIRT}, 1 #{Product::HOODIE}",
        totals: { subtotal_price: 185.00, total_discount: 18.30, total_price: 166.70 }
      })
    end
  end
end
