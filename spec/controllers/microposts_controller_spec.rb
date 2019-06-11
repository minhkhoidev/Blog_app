# frozen_string_literal: true

require 'rails_helper'

describe MicropostsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:micropost) { create(:micropost, user: user) }

  before do
    @micropost_params = attributes_for(:micropost, user: nil)
  end

  def do_request_post
    post :create, params: { micropost: @micropost_params }
  end

  def do_request_delete
    delete :destroy, params: { id: micropost.id }
  end

  context 'with user log in' do
    before do
      sign_in user
    end

    describe '#show' do
      it 'respond successfully' do
        get :show, params: { id: micropost.id }
        expect(response).to be_success
      end

      it 'respond unsuccessfully' do
        get :show, params: { id: 0 }
        expect(response).to_not be_success
      end
    end

    describe '#create' do
      it 'new micropost' do
        expect { do_request_post }.to change(Micropost, :count).by(1)
      end

      it 'redirect user' do
        do_request_post
        expect(response).to redirect_to crud_users_show_path(user)
      end

      it 'post unsuccess' do
        post :create, params: { micropost: { contet:'', title: '' } }
        expect(response).to redirect_to crud_users_show_path(user)
      end
    end

    describe '#destroy' do
      it 'delete micropost' do
        expect { do_request_delete }.to change(Micropost, :count).by(-1)
      end

      it 'redirect to user' do
        do_request_delete
        expect(response).to redirect_to crud_users_show_path(user)
      end
    end
  end

  context 'without user login' do
    describe '#show' do
      it 'responds unsuccessfully' do
        get :show, params: { id: micropost.id }
        expect(response).to_not be_success
      end
    end

    describe '#create' do
      it 'responds unsuccessfully' do
        do_request_post
        expect(response).to_not be_success
      end
    end

    describe '#destroy' do
      it 'responds unsuccessfully' do
        do_request_delete
        expect(response).to_not be_success
      end
    end
  end
end
