require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    # userという変数に対して FactoryBot.createで生成をする
    # user_id: user.id
    @item =FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')

  end

  describe '商品登録が出来るケース' do
    context '投稿の記録が出来る記述'
     it '投稿内容と画像が一緒にあったら保存が可能になる' do
      expect(@item). to be_valid
     end
  end

  describe '商品登録が出来ないケース'
   context '投稿の記録が出来ない記述'
    it  '画像がなければ登録が出来ない' do
     @item.image=nil
     @item.valid?
     expect(@item.errors.full_messages). to include("Image can't be blank")
    end

    it '名前がなければ登録が出来ない' do
      @item.name=nil
      @item.valid?
      expect(@item.errors.full_messages). to include("Name can't be blank")
    end

    it '内容がなければ登録が出来ない' do
      @item.text=nil
      @item.valid?
      expect(@item.errors.full_messages). to include("Text can't be blank")
    end

    it '価格がなければ登録が出来ない' do
      @item.price=nil
      @item.valid?
      expect(@item.errors.full_messages). to include("Price can't be blank")
    end

    it '300円以上でないと登録が出来ない' do
      @item.price= "150"
      @item.valid?
      expect(@item.errors.full_messages). to include("Price must be greater than or equal to 300")
    end

    it '9999999円以内でないと登録が出来ない' do
      @item.price="10000000000000000000"
      @item.valid?
      expect(@item.errors.full_messages). to include("Price must be less than 9999999")
    end

    it '半角でないと登録が出来ない' do
      @item.price= "１"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number" )
    end

    it '選択する都道府県がid値(48)の場合だと登録が出来ない' do
      @item.shipping_area_id= 48
      @item.valid?
      expect(@item.errors.full_messages). to include("Shipping area must be other than 48")
    end

    it '選択する包装日が--を示すid値(1)の場合だと登録が出来ない' do
      @item.shipping_day_id= 1
      @item.valid?
      expect(@item.errors.full_messages). to include("Shipping day must be other than 1")
    end

    it '選択するカテゴリーがid値(1)の場合だと登録が出来ない' do
      @item.category_id= 1
      @item.valid?
      expect(@item.errors.full_messages). to include("Category must be other than 1")
    end

    it '都道府県を選択しないと登録が出来ない' do
      @item.shipping_area_id=nil
      @item.valid?
      expect(@item.errors.full_messages). to include("Shipping area can't be blank", "Shipping area is not a number")
    end

    it '包装日を選択しないと登録が出来ない' do
      @item.shipping_day_id=nil
      @item.valid?
      expect(@item.errors.full_messages). to include("Shipping day can't be blank")
    end

    it 'カテゴリーを選択しないと登録が出来ない' do
      @item.category_id=nil
      @item.valid?
      expect(@item.errors.full_messages). to include("Category can't be blank")
    end
end
