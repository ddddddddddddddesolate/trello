# frozen_string_literal: true

class ColumnSerializer < ActiveModel::Serializer
  attributes :id, :name, :user, :cards

  def user
    object.user
  end

  def cards
    object.cards
  end
end
