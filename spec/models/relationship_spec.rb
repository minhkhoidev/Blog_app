require 'rails_helper'

describe Relationship, type: :model do
  subject { build :relationship }
  context 'factory' do
    it { is_expected.to be_valid }
  end

  context 'association' do
    it { is_expected.to belong_to :followed }
    it { is_expected.to belong_to :follower }
  end

  context 'validate' do
    it { is_expected.to validate_presence_of :follower_id }
    it { is_expected.to validate_presence_of :followed_id }
  end
end
