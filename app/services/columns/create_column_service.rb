# frozen_string_literal: true

module Columns
  class CreateColumnService
    include Callable

    attr_reader :current_user, :column_params

    def initialize(current_user, column_params)
      @current_user = current_user
      @column_params = column_params
    end

    def call
      column = current_user.columns.new(@column_params)

      OpenStruct.new(success: column.save, errors: column.errors, column: column)
    end
  end
end
