# frozen_string_literal: true

class ColumnSerializer < ActiveModel::Serializer
  attributes :id, :name, :userId

  def userId
    object.user_id
  end
end
