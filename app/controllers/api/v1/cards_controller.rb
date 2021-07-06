# frozen_string_literal: true

module Api
  module V1
    class CardsController < AuthenticatedController
      def index
        result = Cards::GetCardsService.call(@current_user, column_params, params[:user_id])

        render json: result.cards,
               status: :ok
      end

      def show
        result = Cards::GetCardService.call(@current_user, column_params, params[:id])

        render json: result.card,
               status: :ok
      end

      def create
        result = Cards::CreateCardService.call(@current_user, column_params, card_params)

        if result.success
          render json: result.card,
                 status: :created
        else
          render json: result.errors,
                 status: :unprocessable_entity
        end
      end

      def update
        result = Cards::UpdateCardService.call(@current_user, column_params, params[:id], card_params)

        if result.success
          render json: result.card,
                 status: :ok
        else
          render json: result.errors,
                 status: :unprocessable_entity
        end
      end

      def destroy
        result = Cards::DeleteCardService.call(@current_user, column_params, params[:id])

        if result.success
          render json: result.success,
                 status: :ok
        else
          render json: result.errors,
                 status: :unprocessable_entity
        end
      end

      private

      def column_params
        params.permit(:column_id)
      end

      def card_params
        params.permit(:title, :text)
      end
    end
  end
end
