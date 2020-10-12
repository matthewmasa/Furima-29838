# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, only: [:index, :create]
  def index
    @orders=OrderAddress.new
    @item= Item.find_by(params[:id])
  end

  def create
    @order=OrderAddress.new(order_params)
    binding.pry
    if @order.valid?
      @order.save
      pay_item
      redirect_to root_pat
      render :index
    end
  end

  private
   def order_params
     params.require(:order_address).permit(:shipping_area_id,:city,:home_number,:building,:telephone,:token,:postal_code)
                           .merge(item_id: params[:item_id],user_id: current_user.id)
   end



   def move_to_index
     redirect_to action: :index unless user_signed_in?
   end

   def pay_item
     @item=Item.find(params[:item_id])
     Payjp.api_key = ENV['PAYJP_SECRET_KEY']

     Payjp::Charge.create(
         amount: @item.price,
         card:   params[:token],
         currency: 'jpy')
   end

end
