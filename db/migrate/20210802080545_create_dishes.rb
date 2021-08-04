class CreateDishes < ActiveRecord::Migration[6.1]
  def change
    create_table :dishes do |t|
      t.string   :english_name
      t.string   :chinese_name
      t.float    :small_price
      t.float    :large_price
      t.string   :dish_type
      t.integer  :position
      t.boolean  :published,    :default => true
      t.text     :description
      t.timestamps
    end
  end
end
