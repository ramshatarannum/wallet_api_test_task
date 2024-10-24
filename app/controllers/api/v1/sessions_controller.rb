# frozen_string_literal: true

module Api
  module V1
    # app/controllers/api/v1/sessions_controller.rb
    class SessionsController < ApplicationController
      def create
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
          session[:user_id] = user.id
          render json: { message: 'Logged in successfully' }, status: :ok
        else
          render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
      end

      def destroy
        session[:user_id] = nil
        render json: { message: 'Logged out successfully' }, status: :ok
      end
    end
  end
end
