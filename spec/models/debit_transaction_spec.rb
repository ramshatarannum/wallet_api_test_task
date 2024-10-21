# frozen_string_literal: true

# spec/models/debit_transaction_spec.rb
require 'rails_helper'

RSpec.describe DebitTransaction, type: :model do
  let(:source_wallet) { create(:wallet, balance: 500) } # Ensure sufficient balance
  let(:debit_transaction) { build(:debit_transaction, source_wallet: source_wallet, amount: 200) }

  describe 'associations' do
    it { is_expected.to belong_to(:source_wallet).class_name('Wallet') }
    it { is_expected.to belong_to(:target_wallet).class_name('Wallet').optional }
  end

  describe 'debit transaction' do
    context 'when the source wallet is nil' do
      it 'raises an error' do
        debit_transaction.source_wallet = nil
        expect { debit_transaction.save! }.to raise_error(ActiveRecord::RecordInvalid, /Source wallet required for debit/)
      end
    end

    context 'when the source wallet has insufficient balance' do
      before { debit_transaction.amount = 600 } # more than the balance in source_wallet
      it 'raises an insufficient funds error' do
        expect { debit_transaction.save! }.to raise_error(ActiveRecord::RecordInvalid, /Insufficient funds/)
      end
    end
  end
end
