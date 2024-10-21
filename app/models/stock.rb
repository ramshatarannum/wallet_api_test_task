# frozen_string_literal: true

# app/models/stock.rb
class Stock < ApplicationRecord
  has_one :wallet, as: :entity, dependent: :destroy
  after_create :create_wallet
end
