FactoryBot.define do
  factory :student do
    first_name { "Test" }
    last_name { "Testerson" }
    email { "test@example.com" }
    password { 'testing123' }
    password_confirmation { 'testing123' }
  end
end
