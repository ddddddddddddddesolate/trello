# frozen_string_literal: true

module Cards
  class CreateCardService
    include Callable

    attr_reader :current_user, :column_params, :card_params

    def initialize(current_user, column_params, card_params)
      @current_user = current_user
      @column_params = column_params
      @card_params = card_params
    end

    def call
      raise Exceptions::Unauthorized, 'Unauthorized' unless @current_user.present?
      column = Column.find_by!(id: @column_params[:column_id])
      @card_params[:user_id] = @current_user.id
      card = column.cards.create(@card_params)

      OpenStruct.new(success: card.valid?, errors: card.errors, card: card)
    end
  end
end
