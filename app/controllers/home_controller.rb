class HomeController < ApplicationController
  def index
  end

  def menu
    @dishes = Dish.all.order("position asc")
    @entree = @dishes.entree
  end
end
