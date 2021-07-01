# frozen_string_literal: true

module Api
  module V1
    class ColumnsController < ApplicationController
      def index
        columns = Columns::GetColumnsService.call(params[:user_id])
        render json: columns
      end
      def create
        column = Columns::CreateColumnService.call(params[:name], params[:user_id])
        render json: column
      end
    end
  end
end
