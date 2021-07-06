# frozen_string_literal: true

module Api
  module V1
    class ColumnsController < AuthenticatedController
      def index
        result = Columns::GetColumnsService.call(@current_user, params[:user_id])

        render json: result.columns,
               status: :ok
      end

      def show
        result = Columns::GetColumnService.call(@current_user, params[:id])

        render json: result.column,
               status: :ok
      end

      def create
        result = Columns::CreateColumnService.call(@current_user, column_params)

        if result.success
          render json: result.column,
                 status: :created
        else
          render json: result.errors,
                 status: :unprocessable_entity
        end
      end

      def update
        result = Columns::UpdateColumnService.call(@current_user, params[:id], column_params)

        if result.success
          render json: result.column,
                 status: :ok
        else
          render json: result.errors,
                 status: :unprocessable_entity
        end
      end

      def destroy
        result = Columns::DeleteColumnService.call(@current_user, params[:id])

        if result.success
          render json: result.success,
                 status: :ok
        else
          render json: result.errors,
                 status: :unprocessable_entity
        end
      end

      def column_params
        params.permit(:name)
      end
    end
  end
end
