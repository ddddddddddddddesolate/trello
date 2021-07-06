# frozen_string_literal: true

module Comments
  class GetCommentService
    include Callable

    attr_reader :card_params, :id

    def initialize(card_params, id)
      @card_params = card_params
      @id = id
    end

    def call
      normalize_params

      card = Card.find_by!(card_params)
      comment = card.comments.find_by!(id: id)

      OpenStruct.new(comment: comment)
    end

    private

    def normalize_params
      card_params[:id] = card_params.delete(:card_id)
    end
  end
end
