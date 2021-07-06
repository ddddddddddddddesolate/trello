# frozen_string_literal: true

module Comments
  class GetCommentsService
    include Callable

    attr_reader :current_user, :card_params, :user_id

    def initialize(current_user, card_params, user_id)
      @card_params = {}

      @current_user = current_user
      @card_params[:column_id] = card_params[:column_id]
      @card_params[:id] = card_params[:card_id]
      @user_id = user_id
    end

    def call
      raise Exceptions::Unauthorized, 'Unauthorized' unless @current_user.present?
      card = Card.find_by!(@card_params)
      if @user_id.present?
        comments = card.comments.where(user_id: @user_id)
      else
        comments = card.comments
      end

      OpenStruct.new(comments: comments)
    end
  end
end
