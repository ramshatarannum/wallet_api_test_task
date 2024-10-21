# frozen_string_literal: true

# spec/models/stock_spec.rb
require 'rails_helper'

RSpec.describe Stock, type: :model do
  describe 'associations' do
    it { should have_one(:wallet).dependent(:destroy) }
  end

  describe 'callbacks' do
    it 'creates a wallet after create' do
      stock = build(:stock)
      expect { stock.save }.to change { Wallet.count }.by(1)
    end
  end
end
