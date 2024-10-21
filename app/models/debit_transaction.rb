# frozen_string_literal: true

# app/models/debit_transaction.rb
class DebitTransaction < Transaction
  belongs_to :source_wallet, class_name: 'Wallet', foreign_key: 'source_wallet_id'
  belongs_to :target_wallet, class_name: 'Wallet', optional: true, foreign_key: 'target_wallet_id'

  before_save :check_funds, if: -> { source_wallet.present? }

  validates :source_wallet, presence: { message: 'Source wallet required for debit' }
  validate :sufficient_funds

  private

  def check_funds
    raise 'Insufficient funds' if source_wallet.balance < amount
  end

  def sufficient_funds
    return unless source_wallet && source_wallet.balance < amount

    errors.add(:base, 'Insufficient funds')
  end

  def debit
    source_wallet.update!(balance: source_wallet.balance - amount)
  end
end
