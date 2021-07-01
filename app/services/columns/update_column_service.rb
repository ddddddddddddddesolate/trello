# frozen_string_literal: true

module Columns
  class UpdateColumnService
    include Callable

    attr_reader :id, :name, :user_id

    def initialize(user_id, id, name)
      @user_id = user_id
      @id = id
      @name = name
    end

    def call
      column = Column.find_by id: @id, user_id: @user_id
      raise StandardError, 'Column not found' unless column.present?

      column.update! name: @name
      column
    end
  end
end
