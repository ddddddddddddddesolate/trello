# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_api_v1_user!, except: [:index]

      def index
        users = User.all
        render json: users,
               status: :ok
      end

      def show
        result = Users::GetUserService.call(@current_api_v1_user, user_params)

        if result.success
          render json: result.user,
                 status: :ok
        else
          render json: result.errors,
                 status: :forbidden
        end
      end

      private

      def user_params
        params.permit(:id)
      end
    end
  end
end
