require 'rails_helper'

describe Micropost, type: :model do
  subject { build :micropost }
  context 'factory' do
    it { is_expected.to be_valid }
  end

  context 'association' do
    it { is_expected.to belong_to :user }
    it { is_expected.to have_many :likes }
    it { is_expected.to have_many :liking_users }
    it { is_expected.to have_many :comments }
    it { is_expected.to have_many :commenting_users }
  end

  context 'validate' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :content }
    it { is_expected.to validate_presence_of :user_id }
    it { is_expected.to validate_presence_of :description }
  end
end
