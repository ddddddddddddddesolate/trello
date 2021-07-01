# frozen_string_literal: true

module Api
  module V1
    class ColumnsController < ApplicationController
      def index
        columns = Columns::GetColumnsService.call(params[:user_id])
        render json: columns
      end

      def show
        column = Columns::GetColumnService.call(params[:user_id], params[:id])
        render json: column
      end

      def create
        column = Columns::CreateColumnService.call(params[:name], params[:user_id])
        render json: column
      end

      def update
        column = Columns::UpdateColumnService.call(params[:user_id], params[:id], params[:name])
        render json: column
      end
    end
  end
end
