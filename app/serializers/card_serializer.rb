# frozen_string_literal: true

class CardSerializer < ActiveModel::Serializer
  attributes :id, :columnId, :userId, :title, :text

  def columnId
    object.column_id
  end

  def userId
    object.user_id
  end
end
