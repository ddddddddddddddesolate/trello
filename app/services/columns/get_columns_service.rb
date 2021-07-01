# frozen_string_literal: true

module Columns
  class GetColumnsService
    include Callable

    attr_reader :user_id

    def initialize(user_id)
      @user_id = user_id
    end

    def call
      Column.where(user_id: @user_id)
    end
  end
end