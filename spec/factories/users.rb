FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email}
    password { '121212' }
    password_confirmation { '121212' }
  end
end
