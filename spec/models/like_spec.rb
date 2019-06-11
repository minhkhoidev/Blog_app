require 'rails_helper'

describe Like, type: :model do
  subject { build :like }
  context 'factory' do
    it { is_expected.to be_valid }
  end

  context 'association' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :micropost }
  end

  context 'validate' do
    it { is_expected.to validate_presence_of :user_id }
    it { is_expected.to validate_presence_of :micropost_id }
  end
end
