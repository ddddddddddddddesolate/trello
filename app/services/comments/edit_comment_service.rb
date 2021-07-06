# frozen_string_literal: true

module Comments
  class EditCommentService
    include Callable

    attr_reader :current_user, :id, :comment_params

    def initialize(current_user, id, comment_params)
      @current_user = current_user
      @id = id
      @comment_params = comment_params
    end

    def call
      comment = current_user.comments.find_by!(id: id)

      OpenStruct.new(success: comment.update(comment_params), errors: comment.errors, comment: comment)
    end
  end
end
