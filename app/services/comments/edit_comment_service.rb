# frozen_string_literal: true

module Comments
  class EditCommentService
    include Callable

    attr_reader :current_user, :card_params, :id, :comment_params

    def initialize(current_user, card_params, id, comment_params)
      @card_params  = {}

      @current_user = current_user
      @card_params[:column_id] = card_params[:column_id]
      @card_params[:id] = card_params[:card_id]
      @id = id
      @comment_params = comment_params
    end

    def call
      raise Exceptions::Unauthorized, 'Unauthorized' unless @current_user.present?
      card = Card.find_by!(@card_params)
      comment = card.comments.find_by!(id: @id)
      raise Exceptions::Forbidden, 'Forbidden' unless comment.user == @current_user

      OpenStruct.new(success: comment.update(@comment_params), errors: comment.errors, comment: comment)
    end
  end
end
