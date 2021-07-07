# frozen_string_literal: true

module Cards
  class CreateCardService
    include Callable

    attr_reader :current_user, :card_params

    def initialize(current_user, card_params)
      @current_user = current_user
      @card_params = card_params
    end

    def call
      card = current_user.cards.new(card_params)

      OpenStruct.new(success: card.save, errors: card.errors, card: card)
    end
  end
end
