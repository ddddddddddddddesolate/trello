# frozen_string_literal: true

module Users
  class GetUsersService
    include Callable

    attr_reader :current_user

    def initialize(current_user)
      @current_user = current_user
    end

    def call
      raise Exceptions::Unauthorized, 'Unauthorized' unless @current_user.present?
      users = User.all
      OpenStruct.new(users: users)
    end
  end
end
