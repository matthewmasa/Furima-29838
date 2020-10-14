# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end


  describe '新規登録' do
   context '新規登録ができた時'
     it "全ての情報が有効だった時に登録が可能となる" do
      expect(user).to be_valid
  describe '新規登録ができないケースの書き出し' do
    contenxt '新規登録できない時' 
     it "nicknameが空では登録できない時" do
       @user.nickname = nil
       @user.valid?
       expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end
     it "emailが空では登録できない時" do
       @user.email = nil
       @user.valid?
       expect(@user.errors.full_messages).to include("Email can't be blank")
     end
     it "アドレスが被ったら登録できない時" do
       @user.save
       another_user = FactoryBot.build(:user)
       another_user.email = @user.email
       another_user.valid?
       expect(another_user.errors.full_messages).to include("Email has already been taken")
     end
     it "passwordが空では登録できない時" do
       @user.password = nil
       @user.valid?
       expect(@user.errors.full_messages).to include("Password can't be blank")
     end
     it "パスワードは半角英数字が一緒でないと登録できない時" do
       @user.password = "123123"
       @user.password_confirmation = "123123"
       @user.valid?
       expect(@user.errors.full_messages).to include("Password is invalid")
     end
     it "passwordが5文字以下であれば登録できない時" do
       @user.password = "00000"
       @user.password_confirmation = "1111"
       @user.valid?
       expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
     end
     it "passwordが存在してもpassword_confirmationが空では登録できない時" do
       @user.password_confirmation = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it "名字が入力されていない時" do
       @user.family_name = nil
       @user.valid?
       expect(@user.errors.full_messages).to include("Family name can't be blank")
     end
     it "名前が入力されていない時" do
       @user.first_name = nil
       @user.valid?
       expect(@user.errors.full_messages).to include("First name can't be blank")
     end
     it "名字(カナ) が入力されていない時" do
       @user.family_name_kana = nil
       @user.valid?
       expect(@user.errors.full_messages).to include("Family name kana can't be blank")
     end
     it "名前（カナ）が入力されていない時" do
       @user.first_name_kana = nil
       @user.valid?
       expect(@user.errors.full_messages).to include("First name kana can't be blank")
     end
     it "生年月日が入力されていない時" do
       @user.birth_day = nil
       @user.valid?
       expect(@user.errors.full_messages).to include("Birth day can't be blank")
     end
     it "emailに@が含まれていない時" do
       @user.email = 'test.com'
       @user.valid?
       expect(@user.errors.full_messages).to include("Email is invalid")
     end
   end
  end
 end
end