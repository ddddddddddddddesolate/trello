# frozen_string_literal: true

module Cards
  class GetCardsService
    include Callable

    attr_reader :current_user, :column_params, :user_id

    def initialize(current_user, column_params, user_id)
      @current_user = current_user
      @column_params = column_params
      @user_id = user_id
    end

    def call
      raise Exceptions::Unauthorized, 'Unauthorized' unless @current_user.present?
      column = Column.find_by!(id: @column_params[:column_id])
      if @user_id.present?
        cards = column.cards.where(user_id: @user_id)
      else
        cards = column.cards
      end

      OpenStruct.new(cards: cards)
    end
  end
end
