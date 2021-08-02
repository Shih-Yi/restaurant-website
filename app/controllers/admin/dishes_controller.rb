class Admin::DishesController < Admin::BaseController

  def new
    @dish = Dish.new
  end
end
