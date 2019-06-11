FactoryBot.define do
  factory :relationship do
    followed { FactoryBot.create(:user) }
    follower {FactoryBot.create(:user) }
  end
end
