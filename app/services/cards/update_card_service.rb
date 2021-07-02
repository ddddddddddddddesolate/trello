# frozen_string_literal: true

module Cards
  class UpdateCardService
    include Callable

    attr_reader :user_id, :column_id, :id, :card_params

    def initialize(user_id, column_id, id, card_params)
      @user_id = user_id
      @column_id = column_id
      @id = id
      @card_params = card_params
    end

    def call
      column = Column.find_by!(id: @column_id, user_id: @user_id)
      card = column.cards.find_by!(id: @id)

      OpenStruct.new(success: card.update?(@card_params), errors: card.errors, card: card)
    end
  end
end
