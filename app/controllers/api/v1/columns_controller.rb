# frozen_string_literal: true

module Api
  module V1
    class ColumnsController < ApplicationController
      def index
        result = Columns::GetColumnsService.call(current_user)

        render json: result.columns
      end

      def show
        result = Columns::GetColumnService.call(current_user, params[:id])

        render json: result.column
      end

      def create
        result = Columns::CreateColumnService.call(current_user, column_params)

        if result.success
          render json: result.column
        else
          render json: result.errors,
                 status: :bad_request
        end
      end

      def update
        result = Columns::UpdateColumnService.call(current_user, params[:id], column_params)

        if result.success
          render json: result.column
        else
          render json: result.errors,
                 status: :unprocessable_entity
        end
      end

      def destroy
        result = Columns::DeleteColumnService.call(current_user, params[:id])

        if result.success
          render json: result.success
        else
          render json: result.errors,
                 status: :unprocessable_entity
        end
      end

      private

      # TODO: change to auth user
      def current_user
        params.require(:user_id)
      end

      def column_params
        params.require(:name)
      end
    end
  end
end
