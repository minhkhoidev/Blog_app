# frozen_string_literal: true

require 'rails_helper'

describe CrudUsersController, type: :controller do
  before do
    @user = create(:user)
  end

  context 'with user log in' do
    before do
      sign_in @user
    end

    describe '#index' do
      it 'responds successfully' do
        get :index
        expect(response).to be_success
      end
    end

    describe '#show' do
      it 'responds successfully' do
        get :show, params: { id: @user.id }
        expect(response).to be_success
      end

      it 'show user' do
        get :show, params: { id: User.first }
        expect(assigns(:user)).to eq(User.first)
      end
    end

    describe "#feed" do
      it "responds successfully" do
        get :feed
        expect(response).to be_success
      end
    end
  end

  context 'without user log in' do
    describe '#index' do
      it 'responds unsuccessfully' do
        get :index
        expect(response).to_not be_success
      end
    end

    describe '#destroy' do
      it 'responds successfully' do
        get :show
        expect(response).to_not be_success
      end
    end
  end
end
