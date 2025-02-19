FactoryBot.define do
  factory :product do
    code { "RUG" }
    name { "rug" }
    price { 150 }

    trait :mug do
      code { Product::MUG }
      name { "mug" }
      price { 6.00 }
    end

    trait :tshirt do
      code { Product::TSHIRT }
      name { "T-shirt" }
      price { 15.00 }
    end

    trait :hoodie do
      code { "HOODIE" }
      name { "Hoodie" }
      price { 20.00 }
    end
  end
end
