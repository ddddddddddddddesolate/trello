# frozen_string_literal: true

module Cards
  class DeleteCardService
    include Callable

    attr_reader :current_user, :id

    def initialize(current_user, id)
      @current_user = current_user
      @id = id
    end

    def call
      card = current_user.cards.find_by!(id: id)

      card.destroy

      OpenStruct.new(success: card.destroyed?, errors: card.errors)
    end
  end
end
