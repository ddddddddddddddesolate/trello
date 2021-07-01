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
      Column.where(user_id: @user_id, id: @id)
    end
  end
end
