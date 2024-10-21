# frozen_string_literal: true

# db/migrate/20241018135328_create_users.rb
class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false, default: ''  # Adding email field
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
