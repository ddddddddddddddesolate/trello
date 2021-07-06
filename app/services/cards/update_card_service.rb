# frozen_string_literal: true

module Cards
  class UpdateCardService
    include Callable

    attr_reader :current_user, :column_params, :id, :card_params

    def initialize(current_user, column_params, id, card_params)
      @current_user = current_user
      @column_params = column_params
      @id = id
      @card_params = card_params
    end

    def call
      raise Exceptions::Unauthorized, 'Unauthorized' unless @current_user.present?
      column = Column.find_by!(id: @column_params[:column_id])
      card = column.cards.find_by!(id: @id)
      raise Exceptions::Forbidden, 'Forbidden' unless card.user == @current_user

      OpenStruct.new(success: card.update(@card_params), errors: card.errors, card: card)
    end
  end
end
