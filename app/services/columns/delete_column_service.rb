# frozen_string_literal: true

module Columns
  class DeleteColumnService
    include Callable

    attr_reader :user_id, :id

    def initialize(user_id, id)
      @user_id = user_id
      @id = id
    end

    def call
      column = Column.find_by!(user_id: @user_id, id: @id)
      column.destroy

      OpenStruct.new(success: column.destroyed?, errors: column.errors)
    end
  end
end
