# frozen_string_literal: true

class ColumnSerializer < ActiveModel::Serializer
  attributes :id, :creator, :name

  def creator
    object.user_id
  end
end
