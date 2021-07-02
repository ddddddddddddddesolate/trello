# frozen_string_literal: true

module Cards
  class DeleteCardService
    include Callable

    attr_reader :user_id, :column_id, :id

    def initialize(user_id, column_id, id)
      @user_id = user_id
      @column_id = column_id
      @id = id
    end

    def call
      column = Column.find_by!(id: @column_id, user_id: @user_id)
      card = column.cards.find_by!(id: @id)

      card.destroy

      OpenStruct.new(success: card.destroyed?, errors: card.errors)
    end
  end
end