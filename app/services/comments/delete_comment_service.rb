# frozen_string_literal: true

module Comments
  class DeleteCommentService
    include Callable

    attr_reader :current_user, :card_params, :id

    def initialize(current_user, card_params, id)
      @card_params = {}

      @current_user = current_user
      @card_params[:column_id] = card_params[:column_id]
      @card_params[:id] = card_params[:card_id]
      @id = id
    end

    def call
      raise Exceptions::Unauthorized, 'Unauthorized' unless @current_user.present?
      card = Card.find_by!(@card_params)
      comment = card.comments.find_by!(id: @id)
      raise Exceptions::Forbidden, 'Forbidden' unless comment.user == @current_user
      comment.destroy
      
      OpenStruct.new(success: comment.destroyed?, errors: comment.errors)
    end
  end
end
