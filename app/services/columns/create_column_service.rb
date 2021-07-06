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
      raise Exceptions::Unauthorized, 'Unauthorized' unless @current_user.present?
      column_params[:user_id] = @current_user.id
      column = Column.create(@column_params)
      
      OpenStruct.new(success: column.valid?, errors: column.errors, column: column)
    end
  end
end
