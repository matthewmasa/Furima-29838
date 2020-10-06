# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    name { 'camera' }
    text            { 'made_in_Japan' }
    category_id     { 2 }
    delivery_fee_id { 2 }
    price           {1200}
    shipping_area_id {4}
    shipping_day_id {3}
    status_id       {2}

    # trait  :image  do
      image {File.open("#{Rails.root}/public/images/test_image.png")}

    # after(:build) do |item|
    # item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    # end

    association :user
  end
end
