# frozen_string_literal: true

# db/migrate/20241018135332_create_stocks.rb
class CreateStocks < ActiveRecord::Migration[7.1]
  def change
    create_table :stocks do |t|
      t.string :name

      t.timestamps
    end
  end
end
