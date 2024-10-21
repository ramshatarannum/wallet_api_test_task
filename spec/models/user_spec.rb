# frozen_string_literal: true

# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'callbacks' do
    context 'after create' do
      it 'creates a wallet for the user' do
        user = User.create!(email: 'test@example.com', password: 'password123')
        expect(user.wallet).to be_present
      end
    end
  end

  describe 'dependent destroy' do
    it 'destroys associated wallet when user is destroyed' do
      user = User.create!(email: 'test@example.com', password: 'password123')
      user.create_wallet

      expect { user.destroy }.to change { Wallet.count }.by(-1)
    end
  end
end
