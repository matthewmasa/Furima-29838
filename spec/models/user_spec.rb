# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do

    let (:user) {FactoryBot.create(:user)}

   describe '新規登録' do
     context '新規登録ができた時'
     it "全ての情報が有効だった時に登録が可能となる" do
      expect(user).to be_valid
    end

   describe '新規登録できない事象' do
     context '新規登録できない時'
     it 'is invalid' do
     user.nickname = "a"
     user.valid?
     expect(user.errors[:nickname]).to be_invalid
     end

     it "nicknameがない状態" do
       user.nickname = nil
       user.valid?
       expect(user.errors.full_messages).to include("Nickname can't be blank")
     end

     it "is invalid if email is not uniqueness " do
       first_user =FactoryBot.create(:user, email: 'test@com')
       second_user=FactoryBot.build(:user,email: 'test@com')
       second_user.valid?
       expect(user.errors[:email]).to include("Email has already used")
     end

     it "emailに@がない時" do
       user.email = nil
       user.valid?
       expect(user.errors.full_messages).to include("Email can't be blank")
     end

     it 'パスワードがない状態' do
       user.password= nil
       user.valid?
       expect(user.errors[:password]).to be_invalid
     end

     it '半角英数での登録じゃない状態' do
       user.password= "123456"
       user.valid?
       expect(user.eroors[:password]).to be_invalid
     end

     it 'is invalid' do
       user.password= "aaaaaaa"
       user.valid?
       expect(user.errors[:password]). to be_invalid
     end

     it 'パスワードが5文字以下の場合' do
       user.password= "a1234"
       user.valid?
       expect(user.errors[:password]).to be_invalid
     end

     it '苗字がない場合' do
       user.family_name=nil
       user.valid?
       expect(user.errors[:family_name]).to be_invalid
     end

     it '名前がない場合' do
       user.first_name=nil
       user.invalid?
       expect(user.errors[:first_name]). to be_invalid
     end

     it '名前がローマ字の場合' do
       user.first_name="aiueo"
       user.invalid?
       expect(user.errors[:first_name]). to be_invalid
     end

     it '苗字がローマ字の場合' do
       user.family_name="aiueo"
       user.invalid?
       expect(user.errors[:family_name]). to be_invalid
     end

     it '名前が数字の場合' do
       user.first_name="12345"
       user.invalid?
       expect(user.errors[:first_name]). to be_invalid
     end

     it '苗字が数字の場合' do
       user.family_name="12345"
       user.invalid?
       expect(user.errors[:family_name]). to be_invalid
     end

     it '名前が半角の場合' do
       user.first_name="ﾔﾏﾀﾞ"
       user.invalid?
       expect(user.errors[:first_name]). to be_invalid
     end

     it '苗字が半角の場合' do
       user.family_name="ﾀﾛｳ"
       user.invalid?
       expect(user.errors[:family_name]). to be_invalid
     end



     it '苗字のカナがない場合' do
       user.family_name_kana=nil
       user.valid?
       expect(user.errors[:family_name_kana]). to be_invalid
     end

     it '名前のカナがない場合' do
       user.first_name_kana=nil
       user.invalid?
       expect(user.errors[:first_name_kana]). to be_invalid
     end

     it 'is invalid' do
       user.firs_name_kana="あああああ"
       user.invalid?
       expect(user.errors[:first_name_kana]). to be_invalid
     end

     it 'is invalid' do
       user.family_name_kana="いいいいい"
       user.valid?
       expect(user.errors[:family_name_kana]). to be_invalid
     end

     it '誕生日がない時' do
       user.birth_day=nil
       user.valid?
       expect(user.errors{:birth_day}). to be_invalid
     end

  #pending "add some examples to (or delete) #{__FILE__}"#
    end
   end
  end