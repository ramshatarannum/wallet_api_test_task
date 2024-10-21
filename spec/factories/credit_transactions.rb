# frozen_string_literal: true

# spec/factories/credit_transactions.rb
FactoryBot.define do
  factory :credit_transaction do
    association :target_wallet, factory: :wallet
    amount { 200 }
  end
end
