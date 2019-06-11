# frozen_string_literal: true

class Micropost < ApplicationRecord
  belongs_to :user
  default_scope { order(created_at: :desc) }
  has_many :likes
  has_many :liking_users, through: :likes, source: :user
  has_many :comments
  has_many :commenting_users, through: :comments, source: :user

  validates :title, presence: true
  validates :content, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
end
