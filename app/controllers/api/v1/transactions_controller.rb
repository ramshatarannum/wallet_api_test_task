# frozen_string_literal: true

module Api
  module V1
    # app/controllers/api/v1/transactions_controller.rb
    class TransactionsController < ApplicationController
      before_action :require_login
      def create
        ActiveRecord::Base.transaction do
          source_wallet, target_wallet = find_wallets
          amount = params[:amount]

          if valid_transaction_type?
            create_transaction(amount, source_wallet, target_wallet)
          else
            render_invalid_transaction_type
          end
        end
      rescue StandardError => e
        render json: { error: e.message }, status: :unprocessable_entity
      end

      private

      def find_wallets
        source_wallet = Wallet.find_by(id: params[:source_wallet_id])
        target_wallet = Wallet.find_by(id: params[:target_wallet_id])
        [source_wallet, target_wallet]
      end

      def valid_transaction_type?
        %w[credit debit].include?(params[:transaction_type])
      end

      def create_transaction(amount, source_wallet, target_wallet)
        case params[:transaction_type]
        when 'credit'
          CreditTransaction.create!(amount: amount, target_wallet: target_wallet)
        when 'debit'
          DebitTransaction.create!(amount: amount, source_wallet: source_wallet)
        end
        render json: { message: 'Transaction created successfully' }, status: :created
      end

      def render_invalid_transaction_type
        render json: { error: 'Invalid transaction type' }, status: :unprocessable_entity
      end
    end
  end
end
