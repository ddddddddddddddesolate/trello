# frozen_string_literal: true

module Cards
  class DeleteCardService
    include Callable

    attr_reader :current_user, :column_id, :id

    def initialize(current_user, column_id, id)
      @current_user = current_user
      @column_id = column_id
      @id = id
    end

    def call
      card = current_user.cards.find_by!(id: id, column_id: column_id)

      card.destroy

      OpenStruct.new(success: card.destroyed?, errors: card.errors)
    end
  end
end
