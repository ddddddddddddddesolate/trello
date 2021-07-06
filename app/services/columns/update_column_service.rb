# frozen_string_literal: true

module Columns
  class UpdateColumnService
    include Callable

    attr_reader :current_user, :id, :column_params

    def initialize(current_user, id, column_params)
      @current_user = current_user
      @id = id
      @column_params = column_params
    end

    def call
      raise Exceptions::Unauthorized, 'Unauthorized' unless @current_user.present?
      column = Column.find_by!(id: @id)
      raise Exceptions::Forbidden, 'Forbidden' unless column.user == @current_user
      
      OpenStruct.new(success: column.update(@column_params), errors: column.errors, column: column)
    end
  end
end
