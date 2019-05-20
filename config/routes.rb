# frozen_string_literal: true

Rails.application.routes.draw do
  root 'crud_user#show'
  get 'relationships/create'
  get 'relationships/destroy'
  mount Ckeditor::Engine => '/ckeditor'
  get 'crud_user/index'
  get 'crud_user/show'
  post 'microposts/create'
  resources :microposts
  resources :relationships, only: %i[create destroy]
  resources :comments, only: %i[create destroy]
  resources :likes, only: %i[create destroy]
  devise_for :users, path: 'user'
end
