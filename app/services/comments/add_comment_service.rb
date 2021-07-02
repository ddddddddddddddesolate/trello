# frozen_string_literal: true

module Comments
  class AddCommentService
    include Callable

    attr_reader :user_id, :column_id, :card_id, :text

    def initialize(user_id, card_params, comment_params)
      @user_id = user_id
      @column_id = card_params[:column_id]
      @card_id = card_params[:card_id]
      @text = comment_params[:text]
    end

    def call
      card = Card.find_by!(id: @card_id, column_id: @column_id)
      comment = card.comments.create!(user_id: @user_id, text: @text)

      OpenStruct.new(success: comment.present?, errors: comment.errors, comment: comment)
    end
  end
end
