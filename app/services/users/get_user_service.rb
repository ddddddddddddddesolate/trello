# frozen_string_literal: true

module Users
  class GetUserService
    include Callable

    attr_reader :current_user, :user_params

    def initialize(current_user, user_params)
      @current_user = current_user
      @user_params = user_params
    end

    def call
      raise Exceptions::Unauthorized, 'Unauthorized' unless @current_user.present?
      user = User.find_by!(@user_params)
      OpenStruct.new(user: user)
    end
  end
end
