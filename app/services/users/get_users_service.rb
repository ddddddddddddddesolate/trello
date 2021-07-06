# frozen_string_literal: true

module Users
  class GetUsersService
    include Callable

    def call
      users = User.all
      OpenStruct.new(users: users)
    end
  end
end
