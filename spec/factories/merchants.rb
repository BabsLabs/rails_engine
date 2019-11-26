FactoryBot.define do
  factory :merchant do
    name { Faker::Company.unique.name.gsub(/\W/, '') }
  end
end
