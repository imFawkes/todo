FactoryBot.define do
  factory :subtask do
    content { Faker::Lorem.sentence }
    task
    
    trait :empty_content do
      content { "" }
    end
  end
end
