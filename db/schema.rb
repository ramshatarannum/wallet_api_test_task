# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 20_241_018_142_022) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'stocks', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'teams', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'transactions', force: :cascade do |t|
    t.bigint 'source_wallet_id'
    t.bigint 'target_wallet_id'
    t.decimal 'amount', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'type'
    t.index ['source_wallet_id'], name: 'index_transactions_on_source_wallet_id'
    t.index ['target_wallet_id'], name: 'index_transactions_on_target_wallet_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'email', default: '', null: false
    t.string 'password_digest', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'wallets', force: :cascade do |t|
    t.string 'entity_type'
    t.bigint 'entity_id'
    t.decimal 'balance', default: '0.0', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[entity_type entity_id], name: 'index_wallets_on_entity'
  end

  add_foreign_key 'transactions', 'wallets', column: 'source_wallet_id'
  add_foreign_key 'transactions', 'wallets', column: 'target_wallet_id'
end