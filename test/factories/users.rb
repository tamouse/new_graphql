require "faker"
FactoryBot.define do
  factory :user do
    username { Faker::Internet.username }
    password { "Password" }
    password_confirmation { "Password" }
    email { Faker::Internet.safe_email }
    preferred_name { Faker::Name.first_name }
    preferred_pronouns {"They/Them/Their"}
  end
end
