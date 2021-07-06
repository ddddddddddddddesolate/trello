# frozen_string_literal: true

module Api
  module V1
    class CardsController < AuthenticatedController
      def index
        result = Cards::GetCardsService.call(params[:column_id], params[:user_id])

        render json: {
                 data: result.cards,
               }, status: :ok
      end

      def show
        result = Cards::GetCardService.call(params[:column_id], params[:id])

        render json: {
                 data: result.card,
               }, status: :ok
      end

      def create
        result = Cards::CreateCardService.call(current_user, params[:column_id], card_params)

        if result.success
          render json: {
                   data: result.card,
                 }, status: :created
        else
          render json: {
                   errors: result.errors,
                 }, status: :unprocessable_entity
        end
      end

      def update
        result = Cards::UpdateCardService.call(current_user, params[:id], card_params)

        if result.success
          render json: {
                   data: result.card,
                 }, status: :ok
        else
          render json: {
                   errors: result.errors,
                 }, status: :unprocessable_entity
        end
      end

      def destroy
        result = Cards::DeleteCardService.call(current_user, params[:id])

        if result.success
          render status: :no_content
        else
          render json: {
                   errors: result.errors,
                 }, status: :unprocessable_entity
        end
      end

      private

      def card_params
        params.permit(:title, :text)
      end
    end
  end
end
