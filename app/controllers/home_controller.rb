class HomeController < ApplicationController
  def index
    @dishes = Dish.all.order("position asc")
    @entree = @dishes.entree
  end

  def menu
    @dishes = Dish.all.order("position asc")
    @dishes_types_array = []
    Dish::TYPE.keys.each do |type|
      @dishes_types_array << @dishes.select { |dish| dish.dish_type == type }
    end
  end
end
