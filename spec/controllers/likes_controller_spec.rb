# frozen_string_literal: true

require 'rails_helper'

describe LikesController, type: :controller do
  let!(:user) { create(:user) }
  let!(:micropost) { create(:micropost) }

  def do_request_post
    post :create, xhr: true, params: { like: like, micropost_id: like.micropost_id }
  end

  def do_request_delete
    delete :destroy, xhr:true, params: { id: like.id, micropost_id: micropost.id }
  end
  context 'with user log in' do
    before do
      sign_in user
    end

    describe '#create' do
      let!(:like) { build(:like, user: user, micropost: micropost) }

      it 'respond successfully' do
        do_request_post
        expect(response).to have_http_status(200)
      end

      it 'create new like' do
        expect { do_request_post }.to change(Like, :count).by(1)
      end

      # it 'redirect to micropost' do
      #   do_request_post
      #   expect(response).to redirect_to micropost
      # end
    end

    describe '#destroy' do
      let!(:like) { create(:like, user: user, micropost: micropost) }

      it 'respond successfully' do
        do_request_delete
        expect(response).to be_success
      end

      it 'delete like' do
        expect { do_request_delete }.to change(Like, :count).by(-1)
      end

      # it 'redirect to micropost' do
      #   do_request_delete
      #   expect(response).to redirect_to micropost
      # end
    end
  end

  context 'without user log in' do
    describe '#create' do
      let!(:like) { build(:like, user: user, micropost: micropost) }

      it 'respond unsuccessfully' do
        do_request_post
        expect(response).to_not be_success
      end
    end

    describe '#destroy' do
      let!(:like) { create(:like, user: user, micropost: micropost) }

      it 'respond unsuccessfully' do
        do_request_post
        expect(response).to_not be_success
      end
    end
  end
end
