# frozen_string_literal: true

# spec/factories/debit_transactions.rb
FactoryBot.define do
  factory :debit_transaction do
    association :source_wallet, factory: :wallet
    amount { 200 }
  end
end
