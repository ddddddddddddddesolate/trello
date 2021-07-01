# frozen_string_literal: true

module Columns
  class CreateColumnService
    include Callable

    attr_reader :user_id, :name

    def initialize(name, user_id)
      @name = name
      @user_id = user_id
    end

    def call
      Column.create! name: @name, user_id: @user_id
    end
  end
end
