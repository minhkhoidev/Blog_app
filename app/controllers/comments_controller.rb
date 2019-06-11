# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @post = Micropost.find_by_id(params[:micropost_id])
    comment = @post.comments.build(comment_params)
    current_user.comments << comment
    respond_to do |format|
      format.html { redirect_to @post }
      format.js
    end
  end

  def destroy
    @post = Micropost.find_by_id(params[:micropost_id])
    comment = Comment.find_by_id(params[:id])
    comment.destroy
    respond_to do |format|
      format.html { redirect_to @post }
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
