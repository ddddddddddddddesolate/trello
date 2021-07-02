# frozen_string_literal: true

module Cards
  class CreateCardService
    include Callable

    attr_reader :user_id, :column_id, :title, :text

    def initialize(user_id, column_id, card_params)
      @user_id = user_id
      @column_id = column_id
      @title = card_params[:title]
      @text = card_params[:text]
    end

    def call
      column = Column.find_by!(id: @column_id, user_id: @user_id)
      card = column.cards.create!(title: @title, text: @text)

      OpenStruct.new(success: card.present?, errors: card.errors, card: card)
    end
  end
end
