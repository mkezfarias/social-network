FactoryBot.define do
  factory :comment do
    post { nil }
    content { "MyText" }
    user { nil }
  end
end
