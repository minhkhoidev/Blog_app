# frozen_string_literal: true

class CrudUsersController < ApplicationController
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def show
    @user = User.find_by_id(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page], per_page: 10)
  end

  def feed
    @user = current_user
    @microposts = Micropost.where("user_id IN (:following_ids) OR user_id = :user_id",
    following_ids: @user.following_ids, user_id: @user.id).paginate(page: params[:page], per_page: 10)
  end
end
