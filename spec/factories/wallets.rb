# frozen_string_literal: true

FactoryBot.define do
  factory :wallet do
    balance { 1000 }
    association :entity, factory: :user
  end
end
