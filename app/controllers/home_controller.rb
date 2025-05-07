class HomeController < ApplicationController
  def index
    @dishes = Dish.order("dishes.position asc")
    @entree = @dishes.entree
    @notice = Notice.first
    @notice_published_active = @notice && @notice.published && @notice.active ? true : false
  end

  def menu
    # Preload all published categories and their dishes, sorted by dish position
    @dish_groups = DishGroup.where(published: true).order(position: :asc)
    
    # Preload all dishes and sort by position
    all_dishes = Dish.includes(:dish_group).order(position: :asc)
    
    # Group dishes by dish_group_id
    dishes_by_group = all_dishes.group_by(&:dish_group_id)
    
    # Organize data for view
    @dish_groups_array = []
    
    @dish_groups.each do |dish_group|
      group_dishes = dishes_by_group[dish_group.id] || []
      
      if group_dishes.any?
        @dish_groups_array << {
          group_type: dish_group.group_type,
          name: dish_group.name,
          dishes: group_dishes,
          group_info: {
            dish_group: dish_group,
            images: dish_group.images
          }
        }
      end
    end
  end
end
