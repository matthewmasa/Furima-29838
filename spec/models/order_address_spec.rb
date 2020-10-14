require 'rails_helper'

Rspec.describe OrderAddress, type: :model do

   Before do
     @user=FactoryBot.build(:user)
     @item=FactoryBot.build(:item)

     @order_address=FactoryBot.build(:order, user_id: user.id,item_id: item.id)
   end
   describe  '商品購入が出来るケース'do
    content '購入の記録が出来る記述'
     it 'ユーザーと商品が一緒にあれば購入が可能になる' do
      expected(@order_address).to be_valid
     end
     it '建物名が空であっても購入が可能になる' do
      @order_address.building=nil
      expected(@order_address).to be_valid
     end
   end

   describe '商品購入が出来ないケース' do
    content '購入の記録が出来ない記述'
     it '郵便番号がなければ購入ができない' do
      @order_address.postal_code=nil
      @order_address.valid?
      expected(@order_address.errors.full_messages).to include("postal_code can't be blank")
     end
     it '郵便番号に-がなければ購入出来ない' do
      @order_address.postal_code= '1234567'
      @order_address.valid?
      expected(@order_address.errors.full_messages). to include("postal_code must include hyphen")
     end
     it '都道府県を選択していなければ購入出来ない' do
       @order_address.shipping_area_id=nil
       @order_address.valid?
       expected(@order_address.errors.full_messages).to include("shipping_area_id can't be blank")
     end
     it '市町村を選択していなければ購入出来ない' do
       @order_address.city=nil
       @order_address.valid?
       expected(@order_address.errors.full_messages).to include("city can't be blank")
     end
     it '番地の入力をしていなければ購入出来ない' do
       @order_address.home_number=nil
       @order_address.valid?
       expected(@order_address.errors.full_messages).to include("home_number can't be blank")
     end
     it '電話番号の入力をしていなければ購入出来ない' do
       @order_address.telephone=nil
       @order_address.valid?
       expected(@order_address.errors.full_messages).to include("telephone can't be blank")
     end
     it '電話番号が11桁超えていると購入出来ない' do
       @order_address.teltphone= '090111111111'
       @order_address.valid?
       expected(@order_address.errors.full_messages).to include("telephone isn't a number")
     end
     it 'tokenが認証されていなければ購入できない' do
       @order_address.token=nil
       @order_address.valid?
       expected(@order_address.errors.full_messages).to include("token can't be blank")
     end
   end
end