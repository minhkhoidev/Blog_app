# frozen_string_literal: true

class LikesController < ApplicationController
  def create
    post = Micropost.find_by_id(params[:post_id])
    redirect_back fallback_location: @post if current_user.like(post)
  end

  def destroy
    post = Micropost.find_by_id(params[:post_id])
    redirect_back fallback_location: @post if current_user.unlike(post)
  end
end
