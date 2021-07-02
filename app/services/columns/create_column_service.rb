# frozen_string_literal: true

module Columns
  class CreateColumnService
    include Callable

    attr_reader :user_id, :name

    def initialize(user_id, name)
      @user_id = user_id
      @name = name
    end

    def call
      column = Column.create!(user_id: @user_id, name: @name)

      OpenStruct.new(success: column.present?, errors: column.errors, column: column)
    end
  end
end
