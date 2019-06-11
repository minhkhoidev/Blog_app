FactoryBot.define do
  factory :like do
    user_id { FactoryBot.create(:user).id }
    micropost_id { FactoryBot.create(:micropost).id }
  end
end
