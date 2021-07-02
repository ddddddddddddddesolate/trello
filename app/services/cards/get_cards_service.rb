# frozen_string_literal: true

module Cards
  class GetCardsService
    include Callable

    attr_reader :user_id, :column_id

    def initialize(user_id, column_id)
      @user_id = user_id
      @column_id = column_id
    end

    def call
      column = Column.find_by!(id: @column_id, user_id: @user_id)
      cards = column.cards

      OpenStruct.new(cards: cards)
    end
  end
end
