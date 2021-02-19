module Api
  module V1
    class UsersController < ApplicationController
      def create
        user = User.new(user_params)
        if user.save
          render json: {
            status: 'ok',
            message: 'User saved',
          }, status: :ok
        else
          render json: {
            status: 'error',
            message: 'Error saving user',
            data: user.error
          }, status: :unprocessable_entity
        end
      end

      def show
        user = User.find(params[:id])
        user.password_digest = ''
        render json: {
          status: 'ok',
          message: 'User loaded',
          data: user
        }, status: :ok
      end

      def user_params
        params.permit(:name, :email, :password)
      end
    end
  end
end