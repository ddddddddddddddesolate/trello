# frozen_string_literal: true

module Cards
  class GetCardsService
    include Callable

    attr_reader :column_id, :user_id

    def initialize(column_id, user_id)
      @column_id = column_id
      @user_id = user_id
    end

    def call
      column = Column.find_by!(id: column_id)
      cards = if user_id.present?
          column.cards.where(user_id: user_id)
        else
          column.cards
        end

      OpenStruct.new(cards: cards)
    end
  end
end
