# frozen_string_literal: true

class CommentSerializer < ActiveModel::Serializer
  attributes :id, :card, :author, :text

  def card
    object.card
  end

  def author
    object.user
  end
end
