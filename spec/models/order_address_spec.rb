require 'rails_helper'

RSpec.describe OrderAddress, type: :model do

   before do

     @user=FactoryBot.create(:user)
     @item=FactoryBot.build(:item)
     @item.image = fixture_file_upload('public/images/test_image.png')
     @item.save
     @order_address=FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
     sleep(1)
   end

   describe  '商品購入が出来るケース'do
    context '購入の記録が出来る記述'
     it 'ユーザーと商品が一緒にあれば購入が可能になる' do
      expect(@order_address).to be_valid
     end
     it '建物名が空であっても購入が可能になる' do
      @order_address.building= " "
      expect(@order_address).to be_valid
     end
   end

   describe '商品購入が出来ないケース' do
    context '購入の記録が出来ない記述'
     it '郵便番号がなければ購入ができない' do
      @order_address.postal_code= " "
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank", "Postal code 例)123-4567")
     end
     it '郵便番号に-がなければ購入出来ない' do
      @order_address.postal_code=  "1234567"
      @order_address.valid?
      expect(@order_address.errors.full_messages). to include("Postal code 例)123-4567")
     end
     it '都道府県のid値を(48)選べば購入出来ない' do
       @order_address.shipping_area_id= "48"
       @order_address.valid?
       expect(@order_address.errors.full_messages).to include("Shipping area must be other than 48")
     end
     it '市町村を選択していなければ購入出来ない' do
       @order_address.city= " "
       @order_address.valid?
       expect(@order_address.errors.full_messages).to include("City can't be blank")
     end
     it '番地の入力をしていなければ購入出来ない' do
       @order_address.home_number= " "
       @order_address.valid?
       expect(@order_address.errors.full_messages).to include("Home number can't be blank")
     end
     it '電話番号の入力をしていなければ購入出来ない' do
       @order_address.telephone= " "
       @order_address.valid?
       expect(@order_address.errors.full_messages).to include("Telephone can't be blank")
     end
     it '電話番号にハイフンがあったら購入出来ない' do
       @order_address.telephone= '090-1111-1111'
       @order_address.valid?
       expect(@order_address.errors.full_messages).to include("Telephone 例)09012345678")
     end

     it '電話番号が11桁超えていると購入出来ない' do
       @order_address.telephone='090111111111'
       @order_address.valid?
       expect(@order_address.errors.full_messages).to include("Telephone 例)09012345678")
     end
     it 'tokenが認証されていなければ購入できない' do
       @order_address.token=" "
       @order_address.valid?
       expect(@order_address.errors.full_messages).to include("Token can't be blank")
     end
   end
end