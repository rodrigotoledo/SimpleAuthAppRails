FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "passwordSecret123!" }
    password_confirmation { "passwordSecret123!" }
  end
end
