# frozen_string_literal: true

Rails.application.routes.draw do
  post 'sessions/create', to: 'sessions#create'
  namespace :api do
    namespace :v1 do
      post 'login', to: 'sessions#create'
      delete 'logout', to: 'sessions#destroy'
      resources :transactions, only: [:create]
      get 'latest_stock_price/price_all', to: 'latest_stock_price#price_all'
    end
  end
end
