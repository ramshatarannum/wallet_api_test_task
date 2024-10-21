# frozen_string_literal: true

# app/models/user.rb
class User < ApplicationRecord
  has_secure_password
  has_one :wallet, as: :entity, dependent: :destroy
  after_create :create_wallet
end
