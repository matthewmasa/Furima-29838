class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string  :title,    nulle: false
      t.text    :text ,    nulle: false
      t.integer :genre_id, nulle: false

      t.timestamps
    end
  end
end
