# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'LatestStockPrice API', type: :request do
  describe 'GET /api/v1/latest_stock_price/price_all' do
    let(:user) { create(:user) } # Assuming you have a factory for User

    context 'when user is logged in' do
      before do
        post '/api/v1/login', params: { email: user.email, password: user.password }
      end

      it 'returns the prices of all stocks' do
        get '/api/v1/latest_stock_price/price_all'
        expect(response).to have_http_status(:ok) # Ensure you pass the correct argument
        expect(JSON.parse(response.body)).to include('prices')
      end
    end

    context 'when user is not logged in' do
      it 'returns unauthorized status' do
        get '/api/v1/latest_stock_price/price_all'
        expect(response).to have_http_status(:unauthorized)  # Correct usage
        expect(JSON.parse(response.body)).to include('error' => 'You must be logged in to access that page.')
      end
    end
  end
end
