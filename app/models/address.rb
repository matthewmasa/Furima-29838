class Address < ApplicationRecord
  #extend ActiveHash::Associations::ActiveRecordExtensions#
  belongs_to :order
end

#this file isオーダーに紐づくモデルの為後々利用する#