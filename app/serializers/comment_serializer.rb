# frozen_string_literal: true

class CommentSerializer < ActiveModel::Serializer
  attributes :id, :cardId, :userId, :text

  def cardId
    object.card_id
  end

  def userId
    object.user_id
  end
end
