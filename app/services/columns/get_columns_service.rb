# frozen_string_literal: true

module Columns
  class GetColumnsService
    include Callable

    attr_reader :current_user, :user_id

    def initialize(current_user, user_id)
      @current_user = current_user
      @user_id = user_id
    end

    def call
      raise Exceptions::Unauthorized, 'Unauthorized' unless @current_user.present?
      if @user_id.present?
        columns = Column.where(user_id: @user_id)
      else
        columns = Column.all
      end
      
      OpenStruct.new(columns: columns)
    end
  end
end