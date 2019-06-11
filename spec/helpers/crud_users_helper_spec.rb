require 'rails_helper'

RSpec.describe CrudUsersHelper, type: :helper do
  let!(:user) { create(:user) }

  context 'user avatar nil ' do
    before do
      user.avatar = nil
    end

    it 'return default avatar' do
      expect(helper.avatar_for(user)).to eq 'empty-avatar.png'
    end
  end

  context 'user avatar' do
    before do
      allow(user).to receive_message_chain(:avatar, :url) { 'example.com' }
    end

    it 'return user avatar' do
      expect(helper.avatar_for(user)).to eq user.avatar.url
    end
  end
end
