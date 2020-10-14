# frozen_string_literal: true
class ItemsController < ApplicationController
  before_action :set_item, only: [:show,:edit,:update,:destroy]
  before_action :authenticate_user!, only:[:create, :edit, :update,:destroy]

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
    if @item.destroy
      render :index
    else
      render :show
    end
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def move_to_show
    redirect_to action: :show unless user_signed_in? && current_user.id != @item.user.id
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

