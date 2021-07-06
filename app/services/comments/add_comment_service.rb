# frozen_string_literal: true

module Comments
  class AddCommentService
    include Callable

    attr_reader :current_user, :card_params, :comment_params

    def initialize(current_user, card_params, comment_params)
      @current_user = current_user
      @card_params = card_params
      @comment_params = comment_params
    end

    def call
      normalize_params

      card = Card.find_by!(card_params)
      comment = card.comments.create(comment_params)

      OpenStruct.new(success: comment.save, errors: comment.errors, comment: comment)
    end

    private

    def normalize_params
      card_params[:id] = card_params.delete(:card_id)
      comment_params[:user_id] = current_user.id
    end
  end
end
