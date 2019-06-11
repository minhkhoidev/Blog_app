require 'rails_helper'

describe CommentsController, type: :controller do
  let(:comment_params) { attributes_for(:comment) }
  let(:user) { create(:user) }

  before :each do
    @comment = create(:comment)
    @micropost = Micropost.find_by_id(@comment[:micropost_id])
  end

  def do_request_delete
    delete :destroy, xhr:true, params: { id: @comment.id, micropost_id: @comment.micropost_id }
  end

  def do_request_post
    post :create, xhr:true, params: { comment: comment_params, micropost_id: comment_params[:micropost_id] }
  end

  context 'with user log in' do
    before :each do
      sign_in user
    end

    describe '#create' do
      it 'create new comment' do
        expect {
          do_request_post
        }.to change(Comment, :count).by(1)
      end

      # it 'redirect to micropost' do
      #   micropost = Micropost.find_by_id(comment_params[:micropost_id])
      #   do_request_post
      #   expect(response).to redirect_to micropost
      # end

      it 'respond successfully' do
        do_request_post
        expect(response).to have_http_status(200)
      end
    end

    describe '#destroy' do
      it 'delete comment' do
        expect { do_request_delete }.to change(Comment, :count).by(-1)
      end

      # it 'redirect micropost' do
      #   do_request_delete
      #   expect(response).to redirect_to @micropost
      # end

      it 'respond successfully' do
        do_request_delete
        expect(response).to have_http_status(200)
      end
    end
  end

  context 'without user log in' do
    describe '#create' do
      it 'responds unsuccessfully' do
        do_request_post
        expect(response).to_not be_success
      end
    end

    describe '#destroy' do
      it 'esponds unsuccessfully' do
        do_request_delete
        expect(response).to_not be_success
      end
    end
  end
end
