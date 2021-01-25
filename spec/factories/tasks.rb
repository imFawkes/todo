FactoryBot.define do
  factory :task do
    content { Faker::Lorem.sentence }
    user
    
    trait :empty_content do
      content { "" }
    end
  end
end
