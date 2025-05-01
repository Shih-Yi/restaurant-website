class CreateDishGroupsFromDishTypes < ActiveRecord::Migration[6.1]
  def up
    # Get all types from Dish::TYPE
    dish_types = Dish.const_get(:TYPE).keys
    
    # Create dish_groups in the order defined in TYPE
    dish_types.each_with_index do |dish_type, index|
      # Get Chinese name for each type
      chinese_name = Dish.const_get(:TYPE)[dish_type]
      
      # Create corresponding dish_group
      dish_group = DishGroup.create!(
        name: dish_type.titleize,    # English name (capitalized)
        group_type: dish_type,       # Use same value as dish_type
        published: true,             # Default to published state
        position: index + 1,         # Set position based on TYPE order
        description: chinese_name    # Use Chinese name as description
      )
      
      puts "Created dish group: #{dish_group.name} (#{dish_group.group_type})"
    end
    
    # Associate all dishes with corresponding dish_groups
    Dish.find_each do |dish|
      next if dish.dish_type.blank?
      
      # Find matching dish_group
      dish_group = DishGroup.find_by(group_type: dish.dish_type)
      
      if dish_group
        dish.update_column(:dish_group_id, dish_group.id)
        puts "Updated dish #{dish.id} (#{dish.english_name}) with dish_group_id: #{dish_group.id}"
      else
        puts "Warning: No dish_group found for dish_type: #{dish.dish_type}"
      end
    end
  end

  def down
    # Remove dish_group_id from all dishes
    Dish.update_all(dish_group_id: nil)
    
    # Delete all automatically created dish_groups
    dish_types = Dish.const_get(:TYPE).keys
    dish_types.each do |dish_type|
      dish_group = DishGroup.find_by(group_type: dish_type)
      dish_group&.destroy
    end
  end
end 