# frozen_string_literal: true

module Comments
  class AddCommentService
    include Callable

    attr_reader :current_user, :card_params, :comment_params

    def initialize(current_user, card_params, comment_params)
      @card_params = {}

      @current_user = current_user
      @card_params[:column_id] = card_params[:column_id]
      @card_params[:id] = card_params[:card_id]
      @comment_params = comment_params
    end

    def call
      raise Exceptions::Unauthorized, 'Unauthorized' unless @current_user.present?
      card = Card.find_by!(@card_params)
      @comment_params[:user_id] = @current_user.id
      comment = card.comments.create(@comment_params)

      OpenStruct.new(success: comment.valid?, errors: comment.errors, comment: comment)
    end
  end
end
