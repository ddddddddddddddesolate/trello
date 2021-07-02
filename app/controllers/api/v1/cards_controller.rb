# frozen_string_literal: true

module Api
  module V1
    class CardsController < ApplicationController
      def index
        result = Cards::GetCardsService.call(current_user, column_params)

        render json: result.cards
      end

      def show
        result = Cards::GetCardService.call(current_user, column_params, params[:id])

        render json: result.card
      end

      def create
        result = Cards::CreateCardService.call(current_user, column_params, card_params)

        if result.success
          render json: result.card
        else
          render json: result.errors,
                 status: :bad_request
        end
      end

      private

      def current_user
        params.require(:user_id)
      end

      def column_params
        params.require(:column_id)
      end

      def card_params
        params.require(:title, :text)
      end
    end
  end
end
