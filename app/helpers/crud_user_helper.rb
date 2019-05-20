# frozen_string_literal: true

module CrudUserHelper
  def avatar_for(user)
    if user.avatar.nil? || user.avatar.url.nil?
      image_tag('empty-avatar.png', alt: user.name, class: 'avatar')
    else
      image_tag(user.avatar.url, alt: user.name, class: 'avatar')
    end
  end
end
