# frozen_string_literal: true

Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  get 'relationships/create'
  get 'relationships/destroy'
  mount Ckeditor::Engine => '/ckeditor'
  get 'crud_users/index'
  get 'crud_users/show'
  get 'crud_user/feed'
  post 'microposts/create'
  resources :microposts
  resources :relationships, only: %i[create destroy]
  resources :comments, only: %i[create destroy]
  resources :likes, only: %i[create destroy]
  devise_for :users, path: 'user'

  devise_scope :user do
    authenticated :user do
      root 'crud_users#feed', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
