class Admin::DishesController < Admin::BaseController
  before_action :set_dish, only: [:edit, :update, :destroy, :update_position]

  def index
    @dishes = Dish.all.order("position asc")
  end

  def new
    @dish = Dish.new
  end

  def edit
  end

  def create
    dish = Dish.new(dish_params)
    dish.save!
    flash[:success] = "Create Successfully"
    redirect_to admin_dishes_path
  end

  def update
    @dish.update(dish_params)
    @dish.save!
    flash[:success] = "Successfully"
    redirect_to admin_dishes_path
  end

  def destroy
    @dish.destroy
    render status: 200, json: { result: "Delete Successfully" }
  end

  def update_position
    @dish.insert_at(params[:position].to_i)
  end

  private

  def set_dish
    @dish = Dish.find(params[:id])
  end

  def dish_params
    params.require(:dish).permit(:dish_type, :english_name, :chinese_name, :small_price, :large_price, :description)
  end
end
