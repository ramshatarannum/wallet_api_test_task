# frozen_string_literal: true

# db/migrate/20241018142003_remove_transaction_type_from_transactions.rb
class RemoveTransactionTypeFromTransactions < ActiveRecord::Migration[7.1]
  def change
    remove_column :transactions, :transaction_type, :string
  end
end
