# frozen_string_literal: true

module Columns
  class DeleteColumnService
    include Callable

    attr_reader :current_user, :id

    def initialize(current_user, id)
      @current_user = current_user
      @id = id
    end

    def call
      column = current_user.columns.find_by!(id: id)

      column.destroy

      OpenStruct.new(success: column.destroyed?, errors: column.errors)
    end
  end
end
