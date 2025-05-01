class AddDishGroupIdToDishes < ActiveRecord::Migration[6.1]
  def change
    add_reference :dishes, :dish_group, foreign_key: true
  end
end 