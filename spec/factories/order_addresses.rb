FactoryBot.define do
  factory :order_address do
    postal_code       {'123-1234'}
    shipping_area_id  {2}
    city              {'東京都'}
    home_number       {'1-1-1'}
    building          {'サンプルハイツ'}
    telephone         {'09011111111'}
    token             {'abcdefghij0123456789'}

   association  :item
   association  :order
  end
end