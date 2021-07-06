# frozen_string_literal: true

module Comments
  class GetCommentsService
    include Callable

    attr_reader :card_params, :user_id

    def initialize(card_params, user_id)
      @card_params = card_params
      @user_id = user_id
    end

    def call
      normalize_params

      card = Card.find_by!(card_params)
      comments = if user_id.present?
          card.comments.where(user_id: user_id)
        else
          card.comments
        end

      OpenStruct.new(comments: comments)
    end

    private

    def normalize_params
      card_params[:id] = card_params.delete(:card_id)
    end
  end
end
