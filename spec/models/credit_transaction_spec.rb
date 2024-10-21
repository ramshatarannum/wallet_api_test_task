# frozen_string_literal: true

# spec/models/credit_transaction_spec.rb
require 'rails_helper'

RSpec.describe CreditTransaction, type: :model do
  let(:target_wallet) { create(:wallet) }
  let(:credit_transaction) { build(:credit_transaction, target_wallet: target_wallet, amount: 200) }

  describe 'associations' do
    it { is_expected.to belong_to(:target_wallet).class_name('Wallet') }
  end

  describe 'credit transaction' do
    context 'when the target wallet is nil' do
      it 'raises an error' do
        credit_transaction.target_wallet = nil
        expect { credit_transaction.send(:credit) }.to raise_error('Target wallet required for credit')
      end
    end

    context 'when the target wallet exists' do
      it 'adds the amount to the target wallet balance' do
        # Ensure wallet balance reflects the credit transaction
        expect { credit_transaction.send(:credit) }.to change { target_wallet.reload.balance }.by(200)
      end
    end
  end
end
