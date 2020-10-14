# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, only: [:index, :create]
  before_action :set_item, only:[:index,:create]
  def index
    @orders=OrderAddress.new
  end

  def create
    @orders=OrderAddress.new(order_params)
    if @orders.valid?
      @orders.save
      pay_item
      redirect_to root_path
    else
      render :index
    end
  end

  private
   def order_params
     params.require(:order_address).permit(:shipping_area_id,:city,:home_number,:building,:telephone,:token,:postal_code)
                           .merge(item_id: params[:item_id],user_id: current_user.id)
   end
   def set_item
     @item=Item.find_by(params[:id])
   end


   def move_to_index
     redirect_to action: :index unless user_signed_in?
   end

   def pay_item
     @item=Item.find(params[:item_id])
     Payjp.api_key = ENV['PAYJP_SECRET_KEY']
     Payjp::Charge.create(
         amount: @item.price,
         card:   order_params[:token],
         currency: 'jpy')
   end

end
