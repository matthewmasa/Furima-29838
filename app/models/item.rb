
class Item < ApplicationRecord
  belongs_to :user
  has_one    :order

  belongs_to_active_hash :shipping_area_id
  belongs_to_active_hash :shipping_day_id
  belongs_to_active_hash :delivery_fee_id
  belongs_to_active_hash :category_id
  belogns_to_active_hash :status_id
  belongs_to_active_hash :genre


  validates :name,  presence: true, length:  {in:2..100}
  validates :text,  presence: true, length:  {in:5..1000}
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 300, less_than: 9999999}
  validates :price, presence: true, format: {with:/\A[0-9]+\z/, imessage: "半角数字のみで入力してください"}
  validates :image, presence: true
  validates :shooing_area_id,:shipping_day_id,:delivery_fee_id,:genre_id, presence: true,
             numericality: { only_integer: true, greater_than: 0}



end
