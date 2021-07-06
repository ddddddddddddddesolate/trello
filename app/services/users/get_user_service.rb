# frozen_string_literal: true

module Users
  class GetUserService
    include Callable

    attr_reader :user_params

    def initialize(user_params)
      @user_params = user_params
    end

    def call
      user = User.find_by!(user_params)
      OpenStruct.new(user: user)
    end
  end
end
