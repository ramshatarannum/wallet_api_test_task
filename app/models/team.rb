# frozen_string_literal: true

# app/models/team.rb
class Team < ApplicationRecord
  has_one :wallet, as: :entity, dependent: :destroy
  after_create :create_wallet
end
