require 'rails_helper'

describe User, type: :model do
  subject { create :user }
  context 'factory' do
    it { is_expected.to be_valid  }
  end

  context 'association' do
    it { is_expected.to have_many :microposts }
    it { is_expected.to have_many :active_relationships }
    it { is_expected.to have_many :passive_relationships }
    it { is_expected.to have_many :following }
    it { is_expected.to have_many :followers }
    it { is_expected.to have_many :likes }
    it { is_expected.to have_many :liking_posts }
    it { is_expected.to have_many :comments }
    it { is_expected.to have_many :commenting_posts }
  end

  context 'validate' do
    it { is_expected.to validate_presence_of :name }
  end

  context 'method' do
    let(:other_user) { create :user }
    let(:micropost) {create :micropost}
    let(:comment) { create :comment, user_id: subject.id }

    it 'follow' do
      expect{
        subject.follow other_user
      }.to change(subject.following, :count).by(1)
    end

    it 'unfollow' do
      subject.follow other_user
      expect{
        subject.unfollow other_user
      }.to change(subject.following, :count).by(-1)
    end

    it 'following?' do
      subject.follow other_user
      result = subject.following? other_user
      expect(result).to eq true
    end

    it 'like' do
      expect{
        subject.like micropost
      }.to change(subject.liking_posts, :count).by(1)
      end

    it 'like?' do
      subject.like micropost
      result = subject.like? micropost
      expect(result).to eq true
    end

    it 'unlike' do
      subject.like micropost
      expect{
        subject.unlike micropost
      }.to change(subject.liking_posts, :count).by(-1)
    end
  end
end
