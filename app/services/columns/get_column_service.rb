# frozen_string_literal: true

module Columns
  class GetColumnService
    include Callable

    attr_reader :current_user, :id

    def initialize(current_user, id)
      @current_user = current_user
      @id = id
    end

    def call
      raise Exceptions::Unauthorized, 'Unauthorized' unless @current_user.present?
      column = Column.find_by!(id: @id)
      OpenStruct.new(column: column)
    end
  end
end
