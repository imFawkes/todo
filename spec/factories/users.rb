FactoryBot.define do
  factory :user do
    username { Faker::Name.first_name }
    email { Faker::Internet.email } 
    password  { Faker::Internet.password }
    
    after(:build)   { |user| user.skip_confirmation_notification! }
    after(:create) { |user| user.confirm } 
  end
end