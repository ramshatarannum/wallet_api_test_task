# frozen_string_literal: true

# app/models/transaction.rb
class Transaction < ApplicationRecord
  belongs_to :source_wallet, class_name: 'Wallet', optional: true
  belongs_to :target_wallet, class_name: 'Wallet', optional: true

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validate :wallet_presence

  def wallet_presence
    return unless source_wallet.nil? && target_wallet.nil?

    errors.add(:base, 'Transaction must have either a source or a target wallet')
  end
end
