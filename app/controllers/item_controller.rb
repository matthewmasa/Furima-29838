# frozen_string_literal: true
class ItemController < ApplicationController
  before_action :set_item, only: [:show,:edit]
  before_action :authenticate_user!, only:[:create, :edit, :update, :show, :destroy]
  def index
    @items=Item.all.order(created_at:"DESC")
  end

  def new
    @item=Item.new(item_params)
  end

  def create
    @item=Item.new(item_params)
    if @item.create
      redirect_to 'root_path'
    else
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    @item=Item.update(item_params)
    if @item.update
      redirect_to 'item_path'
    else
      render :index
    end
  end

  def destroy
    @item=Item.destroy(item_params)
    if @item.destroy
      redirect_to 'item_path'
    else
      render :index
    end
  end

  def move_to_index
    unless user_signed_in?
     redirect_to :index
    end
  end

  private
    def item_params
     params.require(:item).permit(:image,:name,:text,:delivery_fee_id,:category_id,:shipping_area_id,:shipping_day_id,
                                  :status_id,:price).merge(user_id: current_user.id)
    end
    def set_item
      @item=Item.find_by(params[:id])
    end
 end

