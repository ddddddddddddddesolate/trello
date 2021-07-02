# frozen_string_literal: true

module Comments
  class UpdateCommentService
    include Callable

    attr_reader :user_id, :column_id, :card_id, :id, :commenter, :text

    def initialize(user_id, card_params, id, comment_params)
      @user_id = user_id
      @column_id = card_params[:column_id]
      @card_id = card_params[:card_id]
      @id = id
      @commenter = comment_params[:commenter]
      @text = comment_params[:text]
    end

    def call
      card = Card.find_by!(id: @card_id, column_id: @column_id)
      comment = card.comments.find_by!(id: @id)

      if comment.update(user_id: @commenter, text: @text)
        result(true,{}, comment)
      else
        result(false, comment.errors)
      end
    end

    private

    def result(success, errors, comment = nil)
      OpenStruct.new(success: success, errors: errors, comment: comment)
    end
  end
end
