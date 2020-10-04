
class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one    :order
  has_one_attached       :image

  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :category
  belongs_to_active_hash :status

  validates :name,  presence: true, length:  {in:2..100}
  validates :text,  presence: true, length:  {in:5..1000}
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 300, less_than: 9999999}
  validates :price, presence: true, format: {with:/\A[0-9]+\z/, imessage: "半角数字のみで入力してください"}
  validates :image, presence: true
  validates :shipping_day_id,:delivery_fee_id,:category_id, presence: true,
             numericality: { only_integer: true, other_than: 1}
  validates :shipping_area_id, presence: true,  numericality: { only_integer: true, other_than: 48}

end
