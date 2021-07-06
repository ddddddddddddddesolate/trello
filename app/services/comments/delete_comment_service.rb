# frozen_string_literal: true

module Comments
  class DeleteCommentService
    include Callable

    attr_reader :current_user, :id

    def initialize(current_user, id)
      @current_user = current_user
      @id = id
    end

    def call
      comment = current_user.comments.find_by!(id: id)

      comment.destroy

      OpenStruct.new(success: comment.destroyed?, errors: comment.errors)
    end
  end
end
