# frozen_string_literal: true

module Comments
  class DeleteCommentService
    include Callable

    attr_reader :user_id, :column_id, :card_id, :id

    def initialize(user_id, card_params, id)
      @user_id = user_id
      @column_id = card_params[:column_id]
      @card_id = card_params[:card_id]
      @id = id
    end

    def call
      card = Card.find_by!(id: @card_id, column_id: @column_id)
      comment = card.comments.find_by!(id: @id)

      comment.destroy

      if comment.destroyed?
        result(true, {})
      else
        result(false, comment.errors)
      end
    end

    private

    def result(success, errors)
      OpenStruct.new(success: success, errors: errors)
    end
  end
end
