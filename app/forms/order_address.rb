class OrderAddress

  include ActiveModel::Model

  attr_accessor :token, :item_id, :postal_code, :shipping_area_id, :city, :home_number, :building, :telephone, :user_id, :price

  with_options presence: true do
  validates :token
  validates :item_id
  validates :postal_code, format: { with:/\A\d{3}[-]\d{4}\z/, message: '例)123-4567' }
  validates :shipping_area_id, numericality: { other_than: 48}
  validates :city
  validates :home_number
  validates :telephone,format: { with:/\A\d{11}\z/, message: '例)09012345678' }
 end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)

    Address.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, home_number: home_number, building: building, telephone: telephone, order_id: order.id)

  end

end