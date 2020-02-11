FactoryBot.define do
  factory :post do
    content {Faker::Lorem.paragraph(sentence_count: 2)}
    user { nil }
    image { 'google.com' }
  end
end
