# frozen_string_literal: true

# lib/latest_stock_price.rb
require 'httparty'

# lib/latest_stock_price.rb
class LatestStockPrice
  include HTTParty
  base_uri 'https://latest-stock-price.p.rapidapi.com'

  # Set your RapidAPI key here
  RAPIDAPI_KEY = ENV['RAPIDAPI_KEY']

  def self.price(symbol)
    response = get('/price', headers: headers, query: { symbol: symbol })
    handle_response(response)
  end

  def self.prices(symbols)
    response = get('/prices', headers: headers, query: { symbols: symbols.join(',') })
    handle_response(response)
  end

  def self.price_all
    response = get('/any', headers: headers)
    handle_response(response)
  end

  def self.headers
    {
      'X-RapidAPI-Key' => RAPIDAPI_KEY,
      'X-RapidAPI-Host' => 'latest-stock-price.p.rapidapi.com',
      'Accept' => 'application/json',
      'Content-Type' => 'application/json'
    }
  end

  def self.handle_response(response)
    raise "Error fetching data: #{response.code} - #{response.message}" unless response.success?

    response.parsed_response
  end
end
