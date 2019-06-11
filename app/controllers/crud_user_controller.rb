# frozen_string_literal: true

class CrudUserController < ApplicationController
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def show
    @user = if params[:format].nil?
              current_user
            else
              User.find_by_id(params[:format])
            end
    @microposts = @user.microposts.paginate(page: params[:page], per_page: 10)
  end
end
