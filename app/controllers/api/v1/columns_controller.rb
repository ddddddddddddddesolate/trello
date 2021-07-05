# frozen_string_literal: true

module Api
  module V1
    class ColumnsController < ApplicationController
      before_action :authenticate_user!

      def index
        result = Columns::GetColumnsService.call(@current_user, params[:user_id])

        render json: result.columns
      end

      def show
        result = Columns::GetColumnService.call(@current_user, params[:id])

        render json: result.column
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
          render json: result.column
        else
          render json: result.errors,
                 status: :unprocessable_entity
        end
      end

      def destroy
        result = Columns::DeleteColumnService.call(@current_user, params[:id])

        if result.success
          render json: result.success
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
