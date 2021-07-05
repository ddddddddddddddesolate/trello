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
      raise Exceptions::Unauthorized, 'Unauthorized' unless @current_user.present?
      column = Column.find_by!(id: @id)
      raise Exceptions::Forbidden, 'Forbidden' unless column.user == @current_user
      column.destroy
      OpenStruct.new(success: column.destroyed?, errors: column.errors)
    end
  end
end
