FactoryBot.define do
  factory :post do
    content { "MyText" }
    user { nil }
    image { "MyString" }
  end
end
