# frozen_string_literal: true

# db/migrate/20241018135320_create_transactions.rb
class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.references :source_wallet, null: true, foreign_key: { to_table: :wallets }
      t.references :target_wallet, null: true, foreign_key: { to_table: :wallets }
      t.decimal :amount, null: false
      t.string :transaction_type, null: false

      t.timestamps
    end
  end
end
