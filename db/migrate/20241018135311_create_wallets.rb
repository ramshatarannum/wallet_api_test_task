# frozen_string_literal: true

# db/migrate/20241018135311_create_wallets.rb
class CreateWallets < ActiveRecord::Migration[7.1]
  def change
    create_table :wallets do |t|
      t.references :entity, polymorphic: true, null: true
      t.decimal :balance, default: 0.0, null: false

      t.timestamps
    end
  end

  def down
    create_table :wallets do |t|
      t.references :entity, polymorphic: true, null: false
      t.decimal :balance, default: 0.0, null: false

      t.timestamps
    end
  end
end
