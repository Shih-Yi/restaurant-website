class HomeController < ApplicationController
  def index
    @dishes = Dish.all.order("position asc")
    @entree = @dishes.entree
  end

  def menu
    @dishes = Dish.all.order("position asc")
    @entree = @dishes.entree
    @soup = @dishes.soup
    @chicken = @dishes.chicken
    @beef = @dishes.beef
    @all_types = [@entree, @soup, @chicken, @beef]
  end
end
