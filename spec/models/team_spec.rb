# frozen_string_literal: true

# spec/models/team_spec.rb
require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'associations' do
    it { should have_one(:wallet).dependent(:destroy) }
  end

  describe 'callbacks' do
    it 'creates a wallet after create' do
      team = build(:team)
      expect { team.save }.to change { Wallet.count }.by(1)
    end
  end
end
