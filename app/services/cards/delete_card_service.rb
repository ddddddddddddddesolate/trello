# frozen_string_literal: true

module Cards
  class DeleteCardService
    include Callable

    attr_reader :current_user, :column_params, :id

    def initialize(current_user, column_params, id)
      @current_user = current_user
      @column_params = column_params
      @id = id
    end

    def call
      raise Exceptions::Unauthorized, 'Unauthorized' unless @current_user.present?
      column = Column.find_by!(id: @column_params[:column_id])
      card = column.cards.find_by!(id: @id)
      raise Exceptions::Forbidden, 'Forbidden' unless card.user == @current_user
      card.destroy

      OpenStruct.new(success: card.destroyed?, errors: card.errors)
    end
  end
end
