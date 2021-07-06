# frozen_string_literal: true

module Api
  module V1
    class UsersController < AuthenticatedController
      def index
        result = Users::GetUsersService.call

        render json: {
          data: result.users,
        }, status: :ok
      end

      def show
        result = Users::GetUserService.call(user_params)

        render json: {
          data: result.user,
        }, status: :ok
      end

      def user_params
        params.permit(:id)
      end
    end
  end
end
