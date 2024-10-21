# frozen_string_literal: true

# app/models/wallet.rb
class Wallet < ApplicationRecord
  belongs_to :entity, polymorphic: true
  has_many :sent_transactions, class_name: 'Transaction', foreign_key: :source_wallet_id
  has_many :received_transactions, class_name: 'Transaction', foreign_key: :target_wallet_id

  def balance
    sent_amount = sent_transactions.sum(:amount)
    received_amount = received_transactions.sum(:amount)
    received_amount - sent_amount
  end
end
