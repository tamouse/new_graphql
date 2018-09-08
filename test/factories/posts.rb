require "faker"

FactoryBot.define do
  factory :post do
    user { nil }
    title { Faker::FamousLastWords.last_words }
    body { Faker::Lorem.paragraphs(3).join("\n\n") }
    published { false }

    factory :published_post do
      published { true }
    end
  end
end
