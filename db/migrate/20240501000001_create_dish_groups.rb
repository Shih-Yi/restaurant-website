class CreateDishGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :dish_groups do |t|
      t.string :name
      t.text :description
      t.string :group_type
      t.integer :position
      t.boolean :published, default: true
      t.json :images

      t.timestamps
    end
  end
end 