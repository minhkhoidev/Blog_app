# frozen_string_literal: true

module CrudUsersHelper
  def avatar_for(user)
    return User::DEFAULT_AVATAR if user.avatar.blank?
    user.avatar.url
  end
end
