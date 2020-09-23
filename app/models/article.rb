class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre


  validates :title, :text, :genre, presence: true   #空のデータ保存をしないために

  validates :genre_id, numericality:{ other_than: 1}  #ジャンルの--に対応しているシステム

end
