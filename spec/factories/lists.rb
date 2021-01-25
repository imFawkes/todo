FactoryBot.define do
  factory :list do
    name { Faker::Lorem.word }
    user
    
    trait :empty_name do
      name { "" }
    end
  end
end
