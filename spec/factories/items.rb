FactoryBot.define do
  factory :item do
    name { Faker::Commerce.unique.product_name }
    description {Faker::Lorem.sentence(word_count: 5, random_words_to_add: 4) }
    unit_price { 1.5 }
    merchant { nil }
  end
end
