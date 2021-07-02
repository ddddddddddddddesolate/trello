# frozen_string_literal: true

module Api
  module V1
    class CommentsController < ApplicationController
      def index
        result = Comments::GetCommentsService.call(current_user, card_params)

        render json: result.comments
      end

      private

      def current_user
        params.require(:user_id)
      end

      def card_params
        params.permit(:column_id, :card_id)
      end
    end
  end
end
