# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    prefecture_id { 1 }
    city { 'MyString' }
  end
end
