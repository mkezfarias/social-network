FactoryBot.define do
  factory :post do
    content { "MyText" }
    user_id { nil }
    image { "MyString" }
  end
end
