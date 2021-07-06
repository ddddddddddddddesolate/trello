# frozen_string_literal: true

module Cards
  class UpdateCardService
    include Callable

    attr_reader :current_user, :id, :card_params

    def initialize(current_user, id, card_params)
      @current_user = current_user
      @id = id
      @card_params = card_params
    end

    def call
      card = current_user.cards.find_by!(id: id)

      OpenStruct.new(success: card.update(card_params), errors: card.errors, card: card)
    end
  end
end
