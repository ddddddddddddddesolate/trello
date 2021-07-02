# frozen_string_literal: true

module Api
  module V1
    class CardsController < ApplicationController
      def index
        result = Cards::GetCardsService.call(current_user, column_params)

        render json: result.cards
      end

      private

      def current_user
        params.require(:user_id)
      end

      def column_params
        params.require(:column_id)
      end
    end
  end
end
