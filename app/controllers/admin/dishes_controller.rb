class Admin::DishesController < Admin::BaseController

  def index
    @dishes = Dish.all
  end

  def new
    @dish = Dish.new
  end

  def create
    dish = Dish.new(dish_params)
    dish.save!
    flash[:success] = "Create Successfully"
    redirect_to admin_dishes_path
  end

  def update
  end

  private

  def dish_params
    params.require(:dish).permit(:dish_type, :english_name, :chinese_name, :small_price, :large_price, :description)
  end
end
