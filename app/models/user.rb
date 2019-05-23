# frozen_string_literal: true

class User < ApplicationRecord
  has_many :microposts, dependent: :destroy
  # relation
  has_many :active_relationships,  class_name: 'Relationship',
                                   foreign_key: 'follower_id',
                                   dependent: :destroy
  has_many :passive_relationships, class_name: 'Relationship',
                                   foreign_key: 'followed_id',
                                   dependent: :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  # relations
  has_many :likes
  has_many :liking_posts, through: :likes, source: :micropost
  has_many :comments
  has_many :commenting_posts, through: :comments, source: :micropost

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, PictureUploader
  validates :name, presence: true
  validate :avatar_size

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    following.delete(other_user)
  end

  def following?(other_user)
    following.include?(other_user)
  end

  def like(micropost)
    liking_posts << micropost
  end

  def like?(micropost)
    liking_posts.include?(micropost)
  end

  def unlike(post)
    liking_posts.delete(post)
  end

  # def comment(comment)
  #   comments << comment
  # end

  def delete_comment(comment)
    comments.delete(comment)
  end

  def avatar_size
    errors.add(:avatar, 'should be less than 5MB') if avatar.size > 5.megabytes
  end
end
