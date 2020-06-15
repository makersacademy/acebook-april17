FactoryBot.define do

  factory :user do
    name {'John'}
    email {'John@example.com'}
    password {'sosecure'}
    password_confirmation {'sosecure'}
  end

end
