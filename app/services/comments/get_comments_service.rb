# frozen_string_literal: true

module Comments
  class GetCommentsService
    include Callable

    attr_reader :user_id, :column_id, :card_id

    def initialize(user_id, card_params)
      @user_id = user_id
      @column_id = card_params[:column_id]
      @card_id = card_params[:card_id]
    end

    def call
      comments = Card.find_by!(id: card_id, column_id: @column_id).comments

      OpenStruct.new(comments: comments)
    end
  end
end
