# frozen_string_literal: true

class CommentSerializer < ActiveModel::Serializer
  attributes :id, :commenter, :text

  def commenter
    object.user_id
  end
end
