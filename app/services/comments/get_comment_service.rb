# frozen_string_literal: true

module Comments
  class GetCommentService
    include Callable

    attr_reader :user_id, :column_id, :card_id, :id

    def initialize(user_id, card_params, id)
      @user_id = user_id
      @column_id = card_params[:column_id]
      @card_id = card_params[:card_id]
      @id = id
    end

    def call
      column = Column.find_by!(id: @column_id, user_id: @user_id)
      card = column.cards.find_by!(id: @card_id)
      comment = card.comments.find_by!(id: @id)

      OpenStruct.new(comment: comment)
    end
  end
end
