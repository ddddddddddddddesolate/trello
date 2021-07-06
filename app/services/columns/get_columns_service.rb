# frozen_string_literal: true

module Columns
  class GetColumnsService
    include Callable

    attr_reader :user_id

    def initialize(user_id)
      @user_id = user_id
    end

    def call
      columns = if user_id.present?
          Column.where(user_id: user_id)
        else
          Column.all
        end

      OpenStruct.new(columns: columns)
    end
  end
end
