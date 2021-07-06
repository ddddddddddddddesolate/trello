# frozen_string_literal: true

module Columns
  class GetColumnService
    include Callable

    attr_reader :id

    def initialize(id)
      @id = id
    end

    def call
      column = Column.find_by!(id: id)

      OpenStruct.new(column: column)
    end
  end
end
