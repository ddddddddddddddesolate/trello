# frozen_string_literal: true

module Columns
  class GetColumnService
    include Callable

    attr_reader :user_id, :id

    def initialize(user_id, id)
      @user_id = user_id
      @id = id
    end

    def call
      column = Column.where(user_id: @user_id, id: @id)
      raise StandardError, 'Column not found' unless column.present?

      column
    end
  end
end
