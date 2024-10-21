# frozen_string_literal: true

# db/migrate/20241018142022_add_type_to_transactions.rb
class AddTypeToTransactions < ActiveRecord::Migration[7.1]
  def change
    add_column :transactions, :type, :string
  end
end
