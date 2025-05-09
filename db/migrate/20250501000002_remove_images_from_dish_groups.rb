class RemoveImagesFromDishGroups < ActiveRecord::Migration[6.1]
  def change    
    remove_column :dish_groups, :images, :json
  end
end 