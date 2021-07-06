# frozen_string_literal: true

module Api
  module V1
    class ColumnsController < AuthenticatedController
      def index
        result = Columns::GetColumnsService.call(params[:user_id])

        render json: {
                 data: result.columns,
               }, status: :ok
      end

      def show
        result = Columns::GetColumnService.call(params[:id])

        render json: {
                 data: result.column,
               }, status: :ok
      end

      def create
        result = Columns::CreateColumnService.call(current_user, column_params)

        if result.success
          render json: {
                   data: result.column,
                 }, status: :created
        else
          render json: {
                   errors: result.errors,
                 }, status: :unprocessable_entity
        end
      end

      def update
        result = Columns::UpdateColumnService.call(current_user, params[:id], column_params)

        if result.success
          render json: {
                   data: result.column,
                 }, status: :ok
        else
          render json: {
                   errors: result.errors,
                 }, status: :unprocessable_entity
        end
      end

      def destroy
        result = Columns::DeleteColumnService.call(current_user, params[:id])

        if result.success
          render status: :no_content
        else
          render json: {
                   errors: result.errors,
                 }, status: :unprocessable_entity
        end
      end

      def column_params
        params.permit(:name)
      end
    end
  end
end
