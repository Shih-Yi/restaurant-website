class HomeController < ApplicationController
  def index
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
