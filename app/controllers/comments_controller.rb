# frozen_string_literal: true

class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    comment = current_user.comments.create(comment_params)
    redirect_back fallback_location: '/'
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :content)
  end
end
