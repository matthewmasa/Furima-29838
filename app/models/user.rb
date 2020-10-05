# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :orders

  validates :nickname, presence: true, length: { in: 2..50 }
  validates :email, presence: true, length: { in: 5..50 }, uniqueness: { case_sensitive: false }
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :password, presence: true, length: { in: 6..30 }
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/.freeze
  validates :password, presence: true,
                       format: { with: PASSWORD_REGEX }
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :family_name
  end
  with_options presence: true, format:
      { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: '全角カタカナのみで入力して下さい' } do
    validates :first_name_kana
    validates :family_name_kana
  end
  validates :birth_day, presence: true
end
