FactoryBot.define do
  factory :micropost do
    title { Faker::Lorem.sentence(5) }
    content { Faker::Lorem.sentence(5) }
    description { Faker::Lorem.sentence(5) }
    user { FactoryBot.create(:user) }
  end
end
