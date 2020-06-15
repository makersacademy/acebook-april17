FactoryBot.define do
  factory :comment do
    text { "MyText" }
    username { "MyString" }
    post { 1 }
  end
end
