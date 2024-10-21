# frozen_string_literal: true

module Api
  module V1
    # app/controllers/api/v1/latest_stock_price_controller.rb
    class LatestStockPriceController < ApplicationController
      before_action :require_login
      def price_all
        stock_prices = LatestStockPrice.price_all
        render json: { prices: stock_prices }
      rescue StandardError => e
        render json: { error: e.message }, status: :unprocessable_entity
      end
    end
  end
end
