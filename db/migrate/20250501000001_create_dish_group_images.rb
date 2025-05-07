class CreateDishGroupImages < ActiveRecord::Migration[6.1]
  def change
    create_table :dish_group_images do |t|
      t.references :dish_group, null: false, foreign_key: true, index: true
      t.string :image
      t.string :title
      t.integer :position
      t.string :image_type
      t.string :image_size
      
      t.timestamps
    end
  end
end 