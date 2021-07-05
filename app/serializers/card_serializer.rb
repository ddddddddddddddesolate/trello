# frozen_string_literal: true

class CardSerializer < ActiveModel::Serializer
  attributes :id, :title, :text, :column

  def column
    object.column
  end
end
