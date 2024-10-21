# frozen_string_literal: true

# spec/models/transaction_spec.rb
require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'associations' do
    it { should belong_to(:source_wallet).class_name('Wallet').optional }
    it { should belong_to(:target_wallet).class_name('Wallet').optional }
  end

  describe 'validations' do
    it { should validate_presence_of(:amount) }
    it { should validate_numericality_of(:amount).is_greater_than(0) }
  end

  describe 'custom validations' do
    it 'adds error if both wallets are nil' do
      transaction = Transaction.new(amount: 100)
      expect(transaction.valid?).to be_falsey
      expect(transaction.errors[:base]).to include('Transaction must have either a source or a target wallet')
    end
  end
end
