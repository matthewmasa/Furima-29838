# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    nickname {'testtest'}
    sequence(:email) { |n| "test#{n}@test.com"}
    password               {'123abc'}
    family_name            {'山田'}
    first_name             {'太郎'}
    family_name_kana       {'ヤマダ'}
    first_name_kana        {'タロウ'}
    birth_day              {'20200101'}
  end
end
