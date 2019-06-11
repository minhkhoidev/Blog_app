# frozen_string_literal: true

class LikesController < ApplicationController
  def create
    @post = Micropost.find_by_id(params[:micropost_id])
    current_user.like(@post)
    respond_to do |format|
      format.html { redirect_to @post }
      format.js
    end
  end

  def destroy
    @post = Micropost.find_by_id(params[:micropost_id])
    current_user.unlike(@post)
    respond_to do |format|
      format.html { redirect_to @post }
      format.js
    end
  end
end
