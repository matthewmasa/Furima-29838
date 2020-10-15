# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :move_to_index, only: :index
  before_action :move_to_signed_in, except: [:index]
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
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || Order.exists?(item_id: @item.id)
  end


   def move_to_signed_in
     unless user_signed_in?
      #サインインしていないユーザーはログインページが表示される
      redirect_to  '/users/sign_in'
     end
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
