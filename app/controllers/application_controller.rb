# frozen_string_literal: true

# app/controllers/application_controller.rb
class ApplicationController < ActionController::API
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def require_login
    render json: { error: 'You must be logged in to access that page.' }, status: :unauthorized unless logged_in?
  end
end
