# frozen_string_literal: true

module Api
  module V1
    class CommentsController < ApplicationController
      def index
        result = Comments::GetCommentsService.call(current_user, card_params)

        render json: result.comments
      end

      def show
        result = Comments::GetCommentService.call(current_user, card_params, params[:id])

        render json: result.comment
      end

      def create
        result = Comments::AddCommentService.call(current_user, card_params, comment_params)

        if result.success
          render json: result.comment,
                 status: :created
        else
          render json: result.errors,
                 status: :unprocessable_entity
        end
      end

      def update
        result = Comments::UpdateCommentService.call(current_user, card_params, params[:id], comment_params)

        if result.success
          render json: result.comment
        else
          render json: result.errors,
                 status: :unprocessable_entity
        end
      end

      def destroy
        result = Comments::DeleteCommentService.call(current_user, card_params, params[:id])

        if result.success
          render json: result.success
        else
          render json: result.errors,
                 status: :unprocessable_entity
        end
      end

      private

      def current_user
        params.require(:user_id)
      end

      def card_params
        params.permit(:column_id, :card_id)
      end

      def comment_params
        params.permit(:text)
      end
    end
  end
end
