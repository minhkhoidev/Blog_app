# frozen_string_literal: true

class LikesController < ApplicationController
  def create
    post = Micropost.find_by_id(params[:post_id])
    if current_user.like(post)
      redirect_back fallback_location: @post
    end
  end

  def destroy
    post = Micropost.find_by_id(params[:post_id])
    if current_user.unlike(post)
      redirect_back fallback_location: @post
    end
  end
end
