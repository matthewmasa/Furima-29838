# frozen_string_literal: true
class ItemsController < ApplicationController
  before_action :set_item, only: [:show,:edit,:update]
  before_action :authenticate_user!, only:[:create, :edit, :update,:destroy]
  before_action :move_to_index, except: [:index, :show]
  before_action :move_to_show, only: [:edit, :destroy]
  def index
    @items = Item.includes(:user).order(created_at:"DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    if @item.update_attributes(item_params)
       render  :show
    else
      render :edit
    end
  end

  def destroy
    @item=Item.find_by(params[:id])
    if @item.destroy_attributes(item_params)
      redirect_to 'item_path'
    else
      render :index
    end
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
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

