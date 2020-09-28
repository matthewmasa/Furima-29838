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

     it 'is invalid' do
       user.email= "test.com"
       user.valid?
       expect(user.errors[:email]).to be_invalid
     end

     it 'is invalid' do #パスワードがない状態#
       user.password= nil
       user.valid?
       expect(user.errors[:password]).to be_invalid
     end

     it 'is invalid' do #半角英数での登録じゃない状態#
       user.password= "123456"
       user.valid?
       expect(user.eroors[:password]).to be_invalid
     end

     it 'is invalid' do #パスワードが5文字以下の場合#
       user.password= "a1234"
       user.valid?
       expect(user.errors[:password]).to be_invalid
     end

     it 'is invalid' do   #苗字がない場合#
       user.family_name=nil
       user.valid?
       expect(user.errors[:family_name]).to be_invalid
     end

     it 'is invalid' do #名前がない場合#
       user.first_name=nil
       user.invalid?
       expect(user.errors[:first_name]). to be_invalid
     end

     it 'is invalid' do  #苗字のカナがない場合#
       user.family_name_kana=nil
       user.valid?
       expect(user.errors[:family_name_kana]). to be_invalid
     end

     it 'is invalid' do  #名前のカナがない場合#
       user.first_name_kana=nil
       user.invalid?
       expect(user.errors[:first_name_kana]). to be_invalid
     end

     it 'is invalid' do
       user.birth_day=nil
       user.valid?
       expect(user.errors{:birth_day}). to be_invalid
     end

  #pending "add some examples to (or delete) #{__FILE__}"#
    end
   end
  end