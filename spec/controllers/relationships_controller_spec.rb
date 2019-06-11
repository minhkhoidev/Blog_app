# frozen_string_literal: true

require 'rails_helper'

describe RelationshipsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:followed) { create(:user) }
  let!(:relationship) { create(:relationship, follower: user) }

  def do_request_post
    post :create, xhr: true, params: { followed_id: followed.id }
  end

  def do_request_delete
    delete :destroy, xhr: true, params: { id: relationship.id }
  end

  context 'with user login' do
    describe '#create' do
      it 'respond successfully' do
        sign_in user
        do_request_post
        expect(response).to be_success
      end

      it 'create new relationship' do
        sign_in user
        expect { do_request_post }.to change(Relationship, :count).by(1)
      end
    end

    describe '#destroy' do
      it 'delete relationship' do
        sign_in user
        expect { do_request_delete }.to change(Relationship, :count).by(-1)
      end

      it 'respond successfully' do
        sign_in user
        do_request_delete
        expect(response).to be_success
      end
    end
  end

  context 'without user login' do
    describe '#create' do
      it 'respond unsuccessfully' do
        do_request_post
        expect(response).to_not be_success
      end
    end

    describe '#destroy' do
      it 'respond unsuccessfully' do
        do_request_delete
        expect(response).to_not be_success
      end
    end
  end
end
