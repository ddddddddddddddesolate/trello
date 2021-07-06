# frozen_string_literal: true

module Cards
  class GetCardService
    include Callable

    attr_reader :column_id, :id

    def initialize(column_id, id)
      @column_id = column_id
      @id = id
    end

    def call
      card = Card.find_by!(id: id, column_id: column_id)

      OpenStruct.new(card: card)
    end
  end
end
