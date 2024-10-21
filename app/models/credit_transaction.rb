# frozen_string_literal: true

# app/models/credit_transaction.rb
class CreditTransaction < Transaction
  belongs_to :target_wallet, class_name: 'Wallet', foreign_key: 'target_wallet_id'

  private

  def credit
    raise 'Target wallet required for credit' if target_wallet.nil?

    # Save the transaction so it reflects in the wallet's received transactions
    save!
  end
end
