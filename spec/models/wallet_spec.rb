# frozen_string_literal: true

# spec/models/wallet_spec.rb
require 'rails_helper'

RSpec.describe Wallet, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:entity) }
    it { is_expected.to have_many(:sent_transactions).class_name('Transaction').with_foreign_key(:source_wallet_id) }
    it { is_expected.to have_many(:received_transactions).class_name('Transaction').with_foreign_key(:target_wallet_id) }
  end

  describe '#balance' do
    let(:user) { User.create!(name: 'Test User', email: 'testuser@example.com', password: 'password123') }
    let(:wallet) { Wallet.create!(entity: user) }

    before do
      wallet.sent_transactions.create!(amount: 100)
      wallet.received_transactions.create!(amount: 150)
    end

    it 'calculates the correct balance' do
      expect(wallet.balance).to eq(50) # 150 - 100 = 50
    end

    it 'returns a negative balance if sent transactions exceed received' do
      wallet.received_transactions.destroy_all
      expect(wallet.balance).to eq(-100)
    end
  end
end
