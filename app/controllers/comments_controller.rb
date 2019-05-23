# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    post = Micropost.find_by_id(params[:post_id])
    comment = post.comments.build(comment_params)
    redirect_back fallback_location: post if current_user.comments << comment
  end

  def destroy
    post = Micropost.find_by_id(params[:id])
    if Comment.find_by_id(params[:id]).destroy
      redirect_back fallback_location: post
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
