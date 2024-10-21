# frozen_string_literal: true

# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    email { 'alice@gmail.com' }
    password { 'password' }
  end
end
