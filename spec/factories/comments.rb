FactoryBot.define do
  factory :comment do
    user_id { FactoryBot.create(:user).id }
    micropost_id { FactoryBot.create(:micropost).id }
    content { Faker::Lorem.sentence(5) }
  end
end