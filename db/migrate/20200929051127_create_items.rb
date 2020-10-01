class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name
      t.integer :price
      t.integer :genre
      t.integer :delivery_fee_id
      t.integer :shipping_area_id
      t.integer :shipping_day_id
      t.integer :status_id
      t.text    :content
      t.references foreign_key: true


      t.timestamps
    end
  end
end
