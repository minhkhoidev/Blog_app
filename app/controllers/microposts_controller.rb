# frozen_string_literal: true

class MicropostsController < ApplicationController
  def show
    @post = Micropost.find_by_id(params[:id])
    if @post.nil?
      flash.now[:danger] = 'Post have been deleted'
      redirect_to crud_user_show_path(current_user)
    end
  end

  def new
    @post = Micropost.new
  end

  def create
    @post = current_user.microposts.create(micropost_params)
    if @post.save
      flash.now[:success] = 'Post success'
      redirect_to crud_user_show_path(current_user)
    else
      flash.now[:danger] = ' Post unsuccess'
      redirect_to crud_user_show_path(current_user)
    end
  end

  private

  def micropost_params
    params.require(:micropost).permit(:title, :content)
  end
end
