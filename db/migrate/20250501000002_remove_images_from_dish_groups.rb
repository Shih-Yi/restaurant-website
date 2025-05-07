class RemoveImagesFromDishGroups < ActiveRecord::Migration[6.1]
  def change    
    remove_column :dish_groups, :images, :string, array: true, default: []
    remove_column :dish_groups, :image_titles, :jsonb
  end
end 