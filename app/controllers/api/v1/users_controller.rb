# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_user!

      def index
        result = Users::GetUsersService.call(@current_user)

        render json: result.users,
               status: :ok
      end

      def show
        result = Users::GetUserService.call(@current_user, user_params)

        render json: result.user,
               status: :ok
      end

      def user_params
        params.permit(:id)
      end
    end
  end
end
